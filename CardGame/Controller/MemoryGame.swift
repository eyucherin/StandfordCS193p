//
//  MemoryGame.swift
//  CardGame
//
//  Created by Elizabeth Yu on 2022/02/05.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable{
    private(set) var score: Int = 0
    private(set) var cards: Array<Card>
    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get{
            cards.indices.filter({cards[$0].isFacedUp}).oneAndOnly
        }
        set{
            cards.indices.forEach({cards[$0].isFacedUp = ($0 == newValue)})
        }
        
    }
    
    init(numberOfCards:Int, createCardOfType:(Int) -> CardContent){
        cards = []
        for i in 0..<numberOfCards{
            let userContent = createCardOfType(i)
            cards.append(Card(content: userContent))
            cards.append(Card(content: userContent))
        }
        cards.shuffle()
    }

    mutating func Choose (_ card: Card){

        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}),
            !cards[chosenIndex].isFacedUp,
            !cards[chosenIndex].isMatched
        {
            if let potentialMatch = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatch].content{
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatch].isMatched = true
                    score += 2
                }else{
                    if cards[potentialMatch].hasAlreadyBeenSeen || cards[chosenIndex].hasAlreadyBeenSeen{
                        score -= 1
                    }
                }
                cards[chosenIndex].isFacedUp = true
                
            }else{
                for index in cards.indices{
                    if cards[index].isFacedUp{
                        cards[index].isFacedUp = false
                        cards[index].hasAlreadyBeenSeen = true
                    }
                }
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
        }
    }

    struct Card:Identifiable{
        let id = UUID()
        var isFacedUp: Bool = false
        var isMatched: Bool = false
        var hasAlreadyBeenSeen = false
        let content: CardContent
    }
}
extension Array{
    var oneAndOnly: Element? {
        if self.count == 1{
            return self.first
        } else{
            return nil
        }
    }
}
