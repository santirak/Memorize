//
//  ContentView.swift
//  Memorize L1
//
//  Created by Santirak Yothathitikun on 11/6/2566 BE.
//

import SwiftUI

struct ContentView: View {
    
    var emojis = ["⚽️", "🏀", "🏈", "⚾️", "🥎", "🏐", "🏉", "🥏", "🎱", "🪀", "🏓", "🏸" ]
    
    @State var emojiCount = 8
    
    var body: some View {
        VStack{
            ScrollView {
                    
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CoardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
                .foregroundColor(.red)
            }
            Spacer()
            HStack {
                add
                Spacer()
                remove
                
            }.font(.largeTitle)
        
        }
        .padding(.horizontal)

    }
    
    
    
    var remove: some View {
        Button {
            if  emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }
    
    var add: some View {
        Button {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
    }
}


struct CoardView: View {
    
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            }
            else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}
























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

