//
//  ContentView.swift
//  Memorize
//
//  Created by Dwiki Dwiki on 03/05/23.
//

import SwiftUI

struct ContentView: View {
    
    var emojis = ["🚕", "🚗", "🏎️", "🚛", "🚌",
                  "🚎" , "🚁", "🚝", "🚖","🚤", "🚀"]
    
    @State var emojiCount : Int = 4
    
    var removeCard : some View {
        Button(action: {
            if emojiCount > 4 {
                emojiCount -= 1
            } else {
                print("minimum card is 4 !")
            }
        }, label: {
            Image(systemName: "minus.circle.fill")
        })
    }
    
    var addCard : some View {
        Button(action: {
            if emojiCount < emojis.count {
                emojiCount += 1
            } else {
                print("max card already !")
            }
        }, label: {
            Image(systemName: "plus.circle.fill")
        })
    }
    
    var body: some View {
        VStack {
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]){
                    ForEach(emojis[0..<emojiCount], id: \.self  ){ emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack{
               removeCard
               Spacer()
               addCard
            }
            .font(.title)
            .padding(.horizontal)
        }
        .padding(.horizontal)
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
