//
//  CardView.swift
//  Learning SwiftUI
//
//  Created by Leo Yousif on 9/8/21.
//

import SwiftUI

struct Cardify: CardViewProtocol {
    var cornerRaduis: CGFloat = 12.00
    var color: Color = Color(red: 144/255, green: 144/255, blue: 144/255)
    var flipped = true
    
    @ViewBuilder func generateRoundedRectangle(_ content: Content) -> some View {
        let roundedrectangle = RoundedRectangle(cornerRadius: cornerRaduis)
        
        if flipped {
            content
            roundedrectangle.stroke(color)
        }
        else {
            roundedrectangle.fill(color)
        }
        
    }
    
    func body(content: Content) -> some View {
        ZStack{
            generateRoundedRectangle(content)
       }
    }
}

extension View {
    func cardify() -> some View {
        self.modifier(Cardify())
    }
}

//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardView(content: "Hello")
//    }
//}
