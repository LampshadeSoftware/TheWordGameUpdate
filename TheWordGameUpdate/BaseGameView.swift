//
//  BaseGameView.swift
//  TheWordGameUpdate
//
//  Created by Cowboy Lynk on 8/27/17.
//  Copyright © 2017 Lampshade Software. All rights reserved.
//

import UIKit

class BaseGameView: UIView {

    // Outlets
    @IBOutlet var view: UIView!
    @IBOutlet weak var currentWord: Word!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        nibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        nibSetup()
    }
    
    func nibSetup(){
        Bundle.main.loadNibNamed("BaseGameView", owner: self, options: nil)
        self.addSubview(view)
        view.frame = self.bounds
    }

}
