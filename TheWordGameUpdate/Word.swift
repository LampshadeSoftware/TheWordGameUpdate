//
//  Word.swift
//  TheWordGameUpdate
//
//  Created by Cowboy Lynk on 8/27/17.
//  Copyright © 2017 Lampshade Software. All rights reserved.
//

import UIKit

class Word: UIView {
    
    var letters: [Tile] = [Tile]()
    var defaultLetterSize: Double!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    // TURN TYPES: (-1: init), (0: add), (1: rem.), (2: swap), (3: rearr.)
    func updateVisuals(turnType: Int, index: Int){
        let numLetters = Double(letters.count)
        var currentDimension = Double(self.frame.width)/(1.1*numLetters - 0.1)
        var xPos = currentDimension / 2.0
        
        if numLetters > 4 {
            // When not using the default size
        } else {
            currentDimension = Double(self.frame.width)/(1.1*4 - 0.1)
            xPos += Double(4 - letters.count)*currentDimension*1.1/2.0
        }
        
        let scaleDimension = currentDimension/100  // is a decimal value e.g. 0.8
        
        // Cycles through each of the letters in the word
        for index in 0..<letters.count {
            let letter = letters[index]
            letter.transform = CGAffineTransform(scaleX: CGFloat(scaleDimension), y: CGFloat(scaleDimension))
            letter.center = CGPoint(x: xPos, y: 50)
            xPos += currentDimension*1.1
        }
    }
    
    func addLetter(letter: String, index: Int){
        if index <= letters.count {
            let newLetter = Tile(letter: letter)
            newLetter.addIndicator()
            letters.insert(newLetter, at: index)
            self.addSubview(newLetter)
        }
        updateVisuals(turnType: 0, index: index)
    }
    
    func removeLetter(index: Int){
        if index < letters.count {
            letters.remove(at: index)
        }
        updateVisuals(turnType: 1, index: index)
    }
    
    
}
