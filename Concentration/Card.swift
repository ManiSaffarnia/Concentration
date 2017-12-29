//
//  Card.swift
//  Concentration
//
//  Created by mani saffarnia on 12/28/17.
//  Copyright © 2017 mani saffarnia. All rights reserved.
//

import Foundation

struct Card{
    var identifier: Int
    var isMatched = false
    var isFaceUp = false
    
    static var myIdentifierGenerator = 0
    static func getUniqueIdentifier() -> Int{
        myIdentifierGenerator += 1
        return myIdentifierGenerator
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
