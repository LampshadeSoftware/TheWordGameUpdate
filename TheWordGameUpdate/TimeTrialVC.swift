//
//  TimeTrialVC.swift
//  TheWordGameUpdate
//
//  Created by Cowboy Lynk on 8/27/17.
//  Copyright © 2017 Lampshade Software. All rights reserved.
//

import UIKit

class TimeTrialVC: BaseGameVC {

    @IBAction func buttonPressed(_ sender: Any) {
        baseGameView.currentWord.addLetter(letter: "A", index: 1)
    }
    @IBAction func subButtonPressed(_ sender: Any) {
        baseGameView.currentWord.removeLetter(index: 0)
    }
    @IBAction func swapButtonPressed(_ sender: Any) {
        baseGameView.currentWord.swapLetter(letter: "O", index: 0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        baseGameView.currentWord.initLetter(letter: "A", index: 0)
        baseGameView.currentWord.initLetter(letter: "B", index: 1)
        baseGameView.currentWord.initLetter(letter: "C", index: 2)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
