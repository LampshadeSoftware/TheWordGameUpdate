//
//  WordGame.swift
//  TheWordGameUpdate
//
//  Created by Cowboy Lynk on 8/28/17.
//  Copyright © 2017 Lampshade Software. All rights reserved.
//

import Foundation

/*class WordGame: NSObject {
    
    var turns: [Turn]
    var errorLog: String
    
    static var dictionary = WordGame.generateDictionary()
    static var common = WordGame.generateCommons()
    
    override init() {
        turns = [Turn]()
    }
    
    func toAnyObject() -> Any {
        var currentGameState = [Any]()
        for turn in self.turns {
            currentGameState.append(turn.toAnyObject)
        }
        return currentGameState
    }
    
    func isValidPlay(_ play: String, on word: String, last: String) -> Int {
        if !play.isAlpha {
            return -1
        }
        var potential = -1
        
        let validAdd = WordGame.isValidAdd(play, on: word)
        let validSub = WordGame.isValidSub(play, on: word)
        let validRep = WordGame.isValidReplace(play, on: word)
        if validAdd >= 0 {
            if WordGame.addedS(play, on: word) || WordGame.addedD(play, on: word) {
                return -2
            } else {
                potential = validAdd
            }
        } else if validSub >= 0 {
            potential = 100 + validSub
        } else if validRep >= 0 {
            potential = 200 + validRep
        } else if WordGame.isValidRearrange(play, on: word) {
            potential = 300
        } else {
            return -1
        }
        
        if !WordGame.isEnglishWord(play) {
            return -3
        }
        if play == word || alreadyUsed(play) {
            return -4
        }
        if doublePlay(play, last: last) {
            return -5
        }
        if play == "fjord" || play == "fiord" {
            return -6
        }
        
        return potential
        
    }
    static func isValidAdd(_ play: String, on word: String) -> Int {
        if play.characters.count != word.characters.count + 1 {
            return -1
        }
        var i = 0
        while i < word.characters.count {
            if play[i] != word[i] {
                break
            }
            i += 1
        }
        let changeAt = i
        while i+1 < play.characters.count {
            if play[i+1] != word[i] {
                return -1
            }
            i += 1
        }
        return changeAt
    }
    
    static func addedS(_ play: String, on word: String) -> Bool {
        return play.getLastChar() == "s" && word.getLastChar() != "s"
    }
    static func addedD(_ play: String, on word: String) -> Bool {
        return play.getLastChar() == "d" && word.getLastChar() == "e"
    }
    
    static func isValidSub(_ play: String, on word: String) -> Int {
        return isValidAdd(word, on: play)
    }
    static func isValidReplace(_ play: String, on word: String) -> Int {
        if play.characters.count != word.characters.count {
            return -1
        }
        var i = 0
        while i < play.characters.count {
            if play[i] != word[i] {
                i += 1
                break
            }
            i += 1
        }
        let changeAt = i - 1
        while i < word.characters.count {
            if play[i] != word[i] {
                return -1
            }
            i += 1
        }
        return changeAt
    }
    static func isValidRearrange(_ play: String, on word: String) -> Bool {
        if play.characters.count != word.characters.count {
            return false
        }
        
        var letterCount = [Int](repeating: 0, count: 26)
        
        let playVals = play.unicodeScalars.filter{$0.isASCII}.map{$0.value}
        let wordVals = word.unicodeScalars.filter{$0.isASCII}.map{$0.value}
        for val in playVals {
            letterCount[Int(val) - 97] += 1
        }
        for val in wordVals {
            letterCount[Int(val) - 97] -= 1
        }
        for count in letterCount {
            if count != 0 {
                return false
            }
        }
        return true
    }
    static func isEnglishWord(_ play: String) -> Bool {
        let dict = WordGame.dictionary
        var hi = dict.count - 1
        var lo = 0
        var mid: Int
        while true {
            mid = (hi + lo) / 2
            let guess = dict[mid]
            if guess == play {
                return true
            } else if lo > hi {
                return false
            } else {
                if guess < play {
                    lo = mid + 1
                } else { // guess > play
                    hi = mid - 1
                }
            }
            mid = (hi + lo) / 2
        }
    }
    func alreadyUsed(_ play: String) -> Bool {
        for turn in self.turns {
            if turn.playedWord == play {
                return true
            }
        }
        return false
    }
    func doublePlay(_ play: String, last word: String) -> Bool {
        return WordGame.isValidPlayLite(play, on: word)
    }
    
    func submitWord(_ word: String) -> Int {
        let wordLower = word.lowercased()
        let code = isValidPlay(wordLower, on: currentWord, last: lastWord)
        switch code {
        case -1:
            errorLog = "Invalid play! Try again"
            break
        case -2:
            errorLog = "You must change the meaning of the word!"
            break
        case -3:
            errorLog = "Not an English word! Try again"
            break
        case -4:
            errorLog = "\(word) has already been played! Try again"
            break
        case -5:
            errorLog = "Double play! Try again"
            break
        case -6:
            errorLog = "You think you're pretty smart, huh?"
            break
        default:
            usedWords.append(currentWord)
            lastWord = currentWord
            players[turn].addPlayedWord(word: currentWord)
            cyclePlayers()
            currentWord = wordLower
            errorLog = ""
        }
        return code
    }
    
    static func generateDictionary() -> [String] {
        guard let url = Bundle.main.path(forResource: "dictionary", ofType: "txt") else {
            print("Dictionary not found")
            return ["failed"]
        }
        do {
            let stringFromPath = try String(contentsOfFile: url, encoding: String.Encoding.utf8)
            return stringFromPath.components(separatedBy: "\r\n")
        } catch let error as NSError {
            print(error)
            return ["failed"]
        }
    }
    static func generateCommons() -> [String] {
        guard let url = Bundle.main.path(forResource: "common", ofType: "txt") else {
            print("Commons not found")
            return ["failed"]
        }
        do {
            let stringFromPath = try String(contentsOfFile: url, encoding: String.Encoding.utf8)
            return stringFromPath.components(separatedBy: "\n")
        } catch let error as NSError {
            print(error)
            return ["failed"]
        }
    }
}*/

class Turn: NSObject {
    
    var playedWord: String
    var playedByID: String!
    
    init(playedWord: String, playedByID: String) {
        self.playedWord = playedWord
        self.playedByID = playedByID
    }
    
    func toAnyObject() -> Any{
        return [
            "playedWord": playedWord,
            "playedByID": playedByID
        ]
    }
    
}
