//
//  Pie.swift
//  Learning SwiftUI
//
//  Created by Leo Yousif on 9/9/21.
//

import SwiftUI

/**
 Another description
 
 More description
 
 - important: Make sure you read this
 - returns: a Llama spotter rating between 0 and 1 as a Float
 - parameter by: The number of Llamas spotted on the trip
 - version: 1.0
 
 Even more description
 */
struct Pie: Shape {
    var startAngle: Angle
    var endAngle: Angle

    func path(in rect: CGRect) -> Path {
        
        
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius: CGFloat = min(rect.width, rect.height) / 2
        
        let start = CGPoint (
            x: center.x + radius * cos(CGFloat(startAngle.radians)),
            y: center.y + radius * sin(CGFloat(startAngle.radians))
        )
        
        var p = Path()
        p.move(to: center)
        p.addLine(to: start)
        p.addArc(
            center: center,
            radius: radius,
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: true)
        p.addLine(to: center)
        return p
    }
}

//messing around

struct Pieify: ViewModifier {

    var startAngle: Angle
    var endAngle: Angle

    func body(content: Content) -> some View {
        ZStack {
            Pie(startAngle: startAngle, endAngle: endAngle)
            content
        }
    }
}

extension Shape {
    func pieify(startAngle: Angle, endAngle: Angle) -> some View {
        self.modifier(Pieify(startAngle: startAngle, endAngle: endAngle))
    }
}




