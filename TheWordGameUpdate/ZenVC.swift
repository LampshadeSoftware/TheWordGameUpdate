//
//  ZenVC.swift
//  TheWordGameUpdate
//
//  Created by Cowboy Lynk on 8/27/17.
//  Copyright © 2017 Lampshade Software. All rights reserved.
//

import UIKit

class ZenVC: BaseGameVC {
    
    // Outlets
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var hintButton: UIButton!
    
    // Actions
    @IBAction func submitButtonPressed(_ sender: Any) {
        submit()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        childSubmitButton = submitButton
        childHintButton = hintButton
    }
    
    override func viewDidAppear(_ animated: Bool) {
        startGame()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}
