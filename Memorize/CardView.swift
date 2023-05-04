//
//  CardView.swift
//  Memorize
//
//  Created by Dwiki Dwiki on 03/05/23.
//

import SwiftUI

struct CardView: View {
   
    var content : String
    
    @State var isFaceUp: Bool = false
    
    var body: some View {
        ZStack {
                let shape = RoundedRectangle(cornerRadius: 20)
                if isFaceUp {
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: 3).foregroundColor(.red)
                    Text(content)
                        .font(.largeTitle)
                        .foregroundColor(.black)
                } else {
                    shape.fill()
                }
            }
            .onTapGesture {
                self.isFaceUp.toggle()
            }
        
        }
    }

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(content: "wow", isFaceUp: false)
    }
}
