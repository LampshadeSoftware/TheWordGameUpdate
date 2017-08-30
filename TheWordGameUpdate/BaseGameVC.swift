//
//  BaseGameVC.swift
//  TheWordGameUpdate
//
//  Created by Cowboy Lynk on 8/27/17.
//  Copyright © 2017 Lampshade Software. All rights reserved.
//

import UIKit

// Anything that goes in this class is used in ALL gamemodes
// HAS ACCESS TO: baseGameView, all turns
class BaseGameVC: UIViewController {
    
    // Variables from the BaseGameView
    var baseGameView: BaseGameView!
    var currentWord: CurrentWord!
    var lastWord: UILabel!
    var enterWordTextField: UITextField!
    var sysLog: UILabel!
    
    // Variables
    var childSubmitButton: UIButton!
    var childHintButton: UIButton!
    var keyboardHeight: CGFloat!

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
