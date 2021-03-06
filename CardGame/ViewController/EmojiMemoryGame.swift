//
//  EmojiMemoryGame.swift
//  CardGame
//
//  Created by Elizabeth Yu on 2022/02/05.
//

import Foundation
import SwiftUI
//GATEKEEPER : Protect the model from ill behaving views.



class emojiMemoryGame:ObservableObject{
    
    //Making our model private
    //only view model can access
    //ACCESS CONTROL
    
    /*
    private(set) var model: MemoryGame<String> = MemoryGame<String>(numberOfCards: 4, createCardOfType: { (index: Int) -> String in
        return "๐"
    })
     */
    
    init(){
        theme = Self.themes.randomElement()!
        theme.emojis.shuffle()
        model = Self.createGame(theme: theme)
    }
    

    //static let food2  = ["๐","๐","๐"]
    typealias Card = MemoryGame<String>.Card
    
    static var themes:Array<Theme> = [
        Theme(name: "Food", emojis: ["๐","๐","๐","๐","๐","๐","๐ซ","๐","๐","๐","๐ฅญ","๐","๐ฅ","๐ ","๐ฅ","๐ฅฏ","๐ฅจ","๐ง","๐ฅ","๐ณ","๐ฅ","๐ง","๐ฅฉ","๐","๐","๐","๐","๐","๐ฅช","๐ฅ","๐ฎ","๐ฏ","๐ฅ","๐","๐ฒ","๐","๐ฃ","๐ฑ","๐ฅ","๐","๐ฅ","๐","๐ค","๐","๐ข","๐ก","๐ง","๐จ","๐ฆ","๐ฐ","๐","๐ญ","๐ซ","๐ฌ","๐ฐ","๐ฏ"], numberOfPairsToShow: 5, color: "red"),
        Theme(name: "Animals", emojis: ["๐ถ","๐ฑ","๐ญ","๐น","๐ฐ","๐ฆ","๐ป","๐ผ","๐ปโโ๏ธ","๐จ","๐ฏ","๐ฆ","๐ฎ","๐ท","๐ฝ","๐ธ","๐ต","๐","๐ง","๐ฆ","๐ค","๐ฃ"], numberOfPairsToShow: 10, color: "green"),
        Theme(name: "Clothing", emojis: ["๐งฅ","๐ฅผ","๐ฆบ","๐","๐","๐","๐ฉฒ","๐ฉณ","๐","๐","๐ฉฑ","๐","๐ฅป","๐ฉด","๐ฅฟ","๐ ","๐ก","๐ข","๐","๐","๐งค","๐งฆ","๐ฅพ","๐งฃ","๐ฉ","๐งข","๐","โ","๐ช","๐","๐","๐","๐ผ","๐ถ","๐ฅฝ"], numberOfPairsToShow: 12, color: "blue"),
        Theme(name: "Occupation", emojis: ["๐ฎโโ๏ธ","๐ทโโ๏ธ","๐โโ๏ธ","๐ต๏ธโโ๏ธ","๐ฉโโ๏ธ","๐ฉโ๐พ","๐ฉโ๐ณ","๐ฉโ๐","๐ฉโ๐ค","๐ฉโ๐ซ","๐ฉโ๐ญ","๐ฉ๐ปโ๐ป","๐งโ๐ง","๐ฉโ๐ฌ","๐ฉโ๐จ","๐ฉโ๐","๐ฉโโ๏ธ","๐ฉโโ๏ธ","๐ธ","๐คด","๐ฆนโโ๏ธ","๐คถ","๐งโโ๏ธ"], numberOfPairsToShow: 8, color: "yellow"),
        Theme(name: "Vehicles", emojis: ["๐","๐","๐","๐","๐","๐","๐","๐","๐","๐","๐ป","๐","๐","๐","๐ฆฝ","๐ฆผ","๐ด","๐ฒ","๐ต","๐","๐บ","๐","๐","๐","๐ ","๐ก","๐","๐","๐","๐","๐","โ๏ธ","๐ซ","๐ฌ","๐ฉ","๐บ","๐","๐ธ","๐","โต๏ธ","๐ถ","๐ฅ","๐ณ","๐ข"], numberOfPairsToShow: 11, color: "orange")
   
        ]
    
    
    
    
    private static func createGame(theme:Theme) -> MemoryGame<String> {
        MemoryGame<String>(numberOfCards: theme.numberOfPairsToShow){
            index in theme.emojis[index]
            //index in food2[index < food2.count ? index : Int.random(in: food2.indices) ]
        }
    }
    
    @Published var model: MemoryGame<String>
    private var theme: Theme
    
    var themeName: String{
        return theme.name
    }
    
    var themeColor:Color{
        switch theme.color{
        case "red":
            return .red
        case "blue":
            return .blue
        case "yellow":
            return .yellow
        case "orange":
            return .orange
        case "green":
            return .green
        default:
            return .white
        }
    }
    
    var getScore:Int{
        return model.score
    }
    
    var cards: Array<Card>{
        return model.cards
    }
    
    func choose(card:Card){
        model.Choose(card)
    }
    
    
    func newGame(){
        theme = Self.themes.randomElement()!
        theme.emojis.shuffle()
        model = Self.createGame(theme: theme)
    }
    
    func shuffle(){
        model.shuffle()
    }
    
    func restart(){
        model = emojiMemoryGame.createGame(theme: theme)
    }
    
  
    
}
