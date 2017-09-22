//
//  BaseGameVC.swift
//  TheWordGameUpdate
//
//  Created by Cowboy Lynk on 8/27/17.
//  Copyright © 2017 Lampshade Software. All rights reserved.
//

import UIKit

// Anything that goes in this class is used in ALL gamemodes
// RUNS EVERYTHING
class BaseGameVC: UIViewController, UITextFieldDelegate {
    
    // Variables from the BaseGameView
    var baseGameView: BaseGameView!
    var currentWord: CurrentWord!
    var lastWord: UIButton!
    var enterWordTextField: UITextField!
    var sysLog: UILabel!
    
    // Variables
    var activeGame: WordGame!
    var childSubmitButton: UIButton!
    var childHintButton: UIButton!
    var keyboardHeight: CGFloat!
    var currentHint: String = ""
    var activityIndicator: UIActivityIndicatorView!
    
    // Actions
    func currentWordPressed(_ sender: UITapGestureRecognizer) {
        WordGame.showDefinition(forWord: activeGame.getCurrentWord(), VC: self)
    }
    func lastWordButtonPressed(button: UIButton){
        self.performSegue(withIdentifier: "pastWords", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pastWords" {
            let destination = segue.destination as! PastWordsTableVC
            destination.pastWords = activeGame.getUsedWords().reversed()
        }
    }
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		submit()
		return true
	}
	
    // Functions
    func startGame(){
        if activeGame == nil {
            self.activityIndicator.center = self.currentWord.center
            self.activityIndicator.startAnimating()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                self.activeGame = WordGame()
                for letter in Array(self.activeGame.getCurrentWord().characters).reversed() {
                    self.currentWord.initLetter(letter: String(letter).uppercased(), index: 0)
                }
                // Makes the current word clickable
                self.currentWord.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.currentWordPressed(_:))))
                self.activityIndicator.stopAnimating()
            }
        }
    }
    func submit(){
        guard let playedWord = enterWordTextField.text else { return }
        let move = activeGame.submitWord(playedWord)
        
        // If the move is valid
        if move >= 0 {
            let type: Int = move / 100
            let index = move % 100
            if type == 0 {
                currentWord.addLetter(letter: playedWord[index], index: index)
            } else if type == 1 {
                currentWord.removeLetter(index: index)
            } else if type == 2 {
                currentWord.swapLetter(letter: playedWord[index], index: index)
            } else { // type == 3
                currentWord.rearrangeLetters(to: playedWord)
            }
            currentHint = ""
            lastWord.setTitle(activeGame.getLastWord().uppercased(), for: .normal)
        }
        sysLog.text = activeGame.errorLog
        sysLog.textColor = UIColor(colorLiteralRed: 223/255, green: 100/255, blue: 96/255, alpha: 1)
        enterWordTextField.text = ""
    }
    func getHint() {
        self.activityIndicator.center = self.sysLog.center
        self.activityIndicator.startAnimating()
        if sysLog.text?.characters.count != 0 {
            self.activityIndicator.center.y -= 20
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
            if self.currentHint.characters.count == 0{
                let numPlays = WordGame.numPlays(on: self.activeGame.getCurrentWord())
                self.currentHint = "There are " + String(numPlays) + " potential plays on " + self.activeGame.getCurrentWord().uppercased()
            }
            self.sysLog.text = self.currentHint
            self.sysLog.textColor = UIColor(colorLiteralRed: 122/255, green: 223/255, blue: 129/255, alpha: 1)
            self.activityIndicator.stopAnimating()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Adds the base game UI to this view controller
        baseGameView = BaseGameView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height - 64))
        self.view.addSubview(baseGameView)
        self.view.sendSubview(toBack: baseGameView)
        
        // Assigns variables from BaseGameView
        currentWord = baseGameView.currentWord
        lastWord = baseGameView.lastWord
        enterWordTextField = baseGameView.enterWordTextField
        sysLog = baseGameView.sysLog
        
        // Sets the enter word buttons and fields to be right above the keyboard
        NotificationCenter.default.addObserver(self, selector: #selector(BaseGameVC.keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        // UI Stuff
        activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 100, width: 20, height: 20))
        view.addSubview(activityIndicator)
		enterWordTextField.delegate = self
		enterWordTextField.becomeFirstResponder()
        
        // Adds action to the last word button
        lastWord.addTarget(self, action: #selector(lastWordButtonPressed(button:)), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        enterWordTextField.becomeFirstResponder()
    }
    
    // Makes sure the positions of every element are flush with other elements
    func keyboardWillShow(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            keyboardHeight = keyboardRectangle.height
            
            enterWordTextField.center.y = self.view.bounds.height - keyboardHeight - 75
            sysLog.center.y = enterWordTextField.center.y - 45
            currentWord.center.y = (lastWord.center.y + enterWordTextField.center.y)/2
            childSubmitButton.center.y = self.view.bounds.height - keyboardHeight - 25
            
            if childHintButton != nil {
                childHintButton.center.y = self.view.bounds.height - keyboardHeight - 25
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
