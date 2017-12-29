//
//  Concentration.swift
//  Concentration
//
//  Created by mani saffarnia on 12/28/17.
//  Copyright © 2017 mani saffarnia. All rights reserved.
//

import Foundation
import GameplayKit

class Concentration{
    //comment
    var cards = [Card]()
    var indexOfCardFaceUp: Int?
    var isFinish = false
    var remainingCard = 0
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards{
            let card = Card()
            cards += [card,card]
        }
        cards = shuffleTheCards(with: cards)
        remainingCard = cards.count
    }
    
    
    func choosenCard(at index:Int){
        if !cards[index].isMatched{
            if let matchIndex = indexOfCardFaceUp, matchIndex != index{
                //one card faceup and we need to match the new card with this one
                if cards[index].identifier == cards[matchIndex].identifier{
                    cards[index].isMatched = true
                    cards[matchIndex].isMatched = true
                    checkFinish()
                    if isFinish == true{
                        print("finish")
                        // TODO finish game
                    }
                }
                cards[index].isFaceUp = true
                indexOfCardFaceUp = nil
            } else{
                // two cards or no card is face up
                for flipIndex in cards.indices{
                    cards[flipIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfCardFaceUp = index
            }
        }
    }
    
    func checkFinish(){
        remainingCard -= 2
        print(remainingCard)
        if remainingCard == 0{
            isFinish = true
        }
    }
    
    func shuffleTheCards(with cardarray: [Card]) -> [Card]{
        let shuffledArray = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: cardarray)
        print(shuffledArray)
        return shuffledArray as! [Card]
    }
    
}
