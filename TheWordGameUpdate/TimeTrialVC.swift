//
//  TimeTrialVC.swift
//  TheWordGameUpdate
//
//  Created by Cowboy Lynk on 8/27/17.
//  Copyright © 2017 Lampshade Software. All rights reserved.
//

import UIKit

class TimeTrialVC: BaseGameVC {
    
    // Outlets
    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        childSubmitButton = submitButton

        baseGameView.currentWord.initLetter(letter: "C", index: 0)
        baseGameView.currentWord.initLetter(letter: "B", index: 0)
        baseGameView.currentWord.initLetter(letter: "A", index: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
