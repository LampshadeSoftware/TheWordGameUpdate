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
    
    // Variables
    var baseGameView: BaseGameView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Adds the base game UI to this view controller
        baseGameView = BaseGameView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height - 64))
        self.view.addSubview(baseGameView)
        self.view.sendSubview(toBack: baseGameView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
