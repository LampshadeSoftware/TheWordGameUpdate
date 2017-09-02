//
//  BaseGameView.swift
//  TheWordGameUpdate
//
//  Created by Cowboy Lynk on 8/27/17.
//  Copyright © 2017 Lampshade Software. All rights reserved.
//

import UIKit

// Anything that goes in this class is used in ALL gamemodes
// HAS ACCESS TO: last word, current word, enter word text field
class BaseGameView: UIView {

    // Outlets
    @IBOutlet var view: UIView!
    @IBOutlet weak var lastWord: UILabel!
    @IBOutlet weak var currentWord: CurrentWord!
    @IBOutlet weak var enterWordTextField: UITextField!
    @IBOutlet weak var sysLog: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup(){
        nibSetup()
    }
    
    func nibSetup(){
        Bundle.main.loadNibNamed("BaseGameView", owner: self, options: nil)
        self.addSubview(view)
        view.frame = self.bounds
    }
    
    

}
