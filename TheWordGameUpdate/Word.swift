//
//  Word.swift
//  TheWordGameUpdate
//
//  Created by Cowboy Lynk on 8/27/17.
//  Copyright © 2017 Lampshade Software. All rights reserved.
//

import Foundation

class word: NSObject {
    
    var letters: [Tile] = [Tile]()
    
    init(startWord: String) {
        for letter in startWord.characters {
            letters.append(Tile(letter: String(describing: letter)))
        }
    }
    
}
