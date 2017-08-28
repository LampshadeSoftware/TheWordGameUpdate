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
    override func viewDidLoad() {
        super.viewDidLoad()

        baseGameView.currentWord.addLetter(letter: "A", index: 0)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
