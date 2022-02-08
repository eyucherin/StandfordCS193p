//
//  ContentView.swift
//  CardGame
//
//  Created by Elizabeth Yu on 2022/02/05.
//

import SwiftUI

struct cardView: View{
    let card : emojiMemoryGame.Card
    
    var body: some View{
        GeometryReader(content: {geometry in
            ZStack{
                let shape = RoundedRectangle(cornerRadius:DrawingConstants.cornerRadius)
                if card.isFacedUp{
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth:DrawingConstants.lineWidth)
                    Pie(startAngle: Angle(degrees: 0 - 90), endAngle: Angle(degrees: 110 - 90))
                        .padding(DrawingConstants.circlePadding)
                        .opacity(DrawingConstants.circleOpacity)
                  
                    Text(card.content).font(font(in: geometry.size))
                
                }else if(card.isMatched){
                    shape.opacity(0)
                }else{
                    shape.fill()
                    
                }
            }
            
        })
    }
    
    private func font(in size : CGSize) -> Font{
        Font.system(size: min(size.width, size.height) * DrawingConstants.scale)
    }
    
    private struct DrawingConstants{
        static let cornerRadius: CGFloat = 20
        static let lineWidth: CGFloat = 3
        static let scale: CGFloat = 0.70
        static let circlePadding: CGFloat = 5
        static let circleOpacity: CGFloat = 0.5
    }
}

struct EmojiMemoryGameView: View {
    @ObservedObject var game: emojiMemoryGame
    var body: some View {
        VStack {
            HStack {
                Text(game.themeName).font(.largeTitle)
                Spacer()
                Text("Score: \(game.getScore)").font(.largeTitle)
            }
            .padding()
                
            AspectVGrid(items: game.cards, aspectRatio: 2/3, content: { card in
                cardView(card: card)
                    .padding(4)
                    .onTapGesture {
                        self.game.choose(card: card)
                    }
            })
                .foregroundColor(game.themeColor)
                .padding(.horizontal)

            Button {
                game.newGame()
            } label: {
                Text("New Game").font(.largeTitle)
            }
        }
    }
}



struct emojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        let game = emojiMemoryGame()
        game.choose(card: game.cards.first!)
//        EmojiMemoryGameView(game: game)
//            .preferredColorScheme(.dark)
        return EmojiMemoryGameView(game: game)
            .preferredColorScheme(.light)
    }
}
