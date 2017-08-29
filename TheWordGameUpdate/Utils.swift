//
//  Utils.swift
//  TheWordGameUpdate
//
//  Created by Cowboy Lynk on 8/28/17.
//  Copyright © 2017 Lampshade Software. All rights reserved.
//

import Foundation
import UIKit

class Turn: NSObject {
    
    var playedWord: String
    var playedBy: String!
    
    init(playedWord: String, playedBy: String) {
        self.playedWord = playedWord
        self.playedBy = playedBy
    }
    
    func toAnyObject() -> [String: String]{
        return [
            "playedWord": playedWord,
            "playedBy": playedBy
        ]
    }
    
}
