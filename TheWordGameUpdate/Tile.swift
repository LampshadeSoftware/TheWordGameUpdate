//
//  Tile.swift
//  TheWordGameUpdate
//
//  Created by Cowboy Lynk on 8/27/17.
//  Copyright © 2017 Lampshade Software. All rights reserved.
//

import Foundation
import UIKit


class Tile: UIView {
    var letter: String!
    var changedLetterIndicator = UIView()
    let label = UILabel()
    let defaultDimension = 100
    
    init(letter: String){
        super.init(frame: CGRect())
        
        self.letter = letter
        
        // Tile styling
        self.frame.size = CGSize(width: defaultDimension, height: defaultDimension)
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowRadius = 5
        self.backgroundColor = .white
        self.layer.shadowOffset = CGSize(width: 0, height: self.frame.height/12)
        self.layer.cornerRadius = 15
        self.alpha = 0
        
        // Label styling
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 40)
        label.text = self.letter
        label.frame.size = CGSize(width: defaultDimension, height: defaultDimension)
        label.textColor = .gray
        label.textAlignment = .center
        self.addSubview(label)
        
        // Changed letter indicator styling
        changedLetterIndicator.frame = CGRect(origin: CGPoint(x: 0, y: self.bounds.height), size: CGSize(width: 50, height: 10))
        changedLetterIndicator.alpha = 0
        changedLetterIndicator.center.x = self.bounds.width/2
        changedLetterIndicator.backgroundColor = UIColor(red:0.94, green:0.56, blue:0.23, alpha:1.0)
        self.addSubview(changedLetterIndicator)
    }
    
    func addIndicator(){
        changedLetterIndicator.alpha = 1
    }
    
    func removeIndicator(){
        changedLetterIndicator.alpha = 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
