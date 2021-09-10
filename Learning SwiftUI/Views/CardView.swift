//
//  CardView.swift
//  Learning SwiftUI
//
//  Created by Leo Yousif on 9/8/21.
//

import SwiftUI
struct CardView: CardViewProtocol {
    var content: String = "default"
    var cornerRaduis: CGFloat = 12.00
    var color: Color = Color(red: 144/255, green: 144/255, blue: 144/255)
    var flipped = true
    
    @ViewBuilder var generateRoundedRectangle: some View {
        let roundedrectangle = RoundedRectangle(cornerRadius: cornerRaduis)
        
        if flipped {
            Pie(startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0)).padding().opacity(0.4)
            roundedrectangle.stroke(color)
        }
        else {
            roundedrectangle.fill(color)
        }
        
    }
    
    var generateText: some View {
        let text: Text = Text(content)
        
        return ZStack {
            if flipped {
                text.foregroundColor(color)
            }
        }
    }
    
    var body: some View {
        ZStack {
            generateRoundedRectangle
            generateText
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(content: "Hello")
    }
}
