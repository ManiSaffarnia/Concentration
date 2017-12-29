//
//  ViewController.swift
//  Concentration
//
//  Created by mani saffarnia on 12/28/17.
//  Copyright © 2017 mani saffarnia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count+1)/2)
    var flipCount = 0{
        didSet{
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    var emojiArray = ["👻","🎃","😈","👹","🍎","🍒","🍓","🍇","🐼","🦊","🦁","🐮","🐷","🐸","🐵","👽","🤖","🍭","🍩","🍕","🌶","🍰","🍄","🐙","🤡","🤢","😡","😍","😘","💩","🐻","🦀","⚽️","🏀"]
    
    //=========
    //IBoutlets
    //
    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet weak var restartButton: UIButton!
    @IBOutlet weak var congrateLabel: UILabel!
    @IBOutlet weak var winLabel: UILabel!
    
    
    override func viewDidLoad() {
        restartButton.isHidden = true
        congrateLabel.isHidden = true
        winLabel.isHidden = true
    }
    //=========
    //Functions
    //
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender){
            game.choosenCard(at: cardNumber)
            updateViewFromModel()
        }
    }//end touchCard
    
    func updateViewFromModel(){
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                button.setTitle(selectEmoji(for: card), for: UIControlState.normal)
            } else{
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
                button.setTitle("", for: UIControlState.normal)
            }
            if game.isFinish == true{
                restartButton.isHidden = false
                congrateLabel.isHidden = false
                winLabel.isHidden = false
            }
        }
    }//end updateViewFromModel
    
    var emoji  = [Int:String]()
    
    func selectEmoji(for card: Card) -> String{
        if emoji[card.identifier] == nil, emojiArray.count > 0 {
            let randomNumber = Int(arc4random_uniform(UInt32(emojiArray.count)))
            emoji[card.identifier] = emojiArray.remove(at: randomNumber)
        }
        return emoji[card.identifier] ?? "?"
    }//end selectEmoji

}

