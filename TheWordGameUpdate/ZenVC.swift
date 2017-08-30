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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        childSubmitButton = submitButton
        childHintButton = hintButton
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}
