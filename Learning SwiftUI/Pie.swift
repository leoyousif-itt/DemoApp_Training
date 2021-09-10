//
//  Pie.swift
//  Learning SwiftUI
//
//  Created by Leo Yousif on 9/9/21.
//

import SwiftUI

struct Pie: Shape {
    var startAngle: Angle
    var endAngle: Angle
    

    func path(in rect: CGRect) -> Path {
        var p = Path()
        
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius: CGFloat = min(rect.width, rect.height) / 2

        
        let start = CGPoint (
            x: center.x + radius * cos(CGFloat(startAngle.radians)),
            y: center.y + radius * cos(CGFloat(startAngle.radians))
        )
        
        p.move(to: center)
        p.addLine(to: start)
        p.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        p.addLine(to: start)
        return p
    }
}


