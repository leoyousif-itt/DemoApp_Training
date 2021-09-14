//
//  Home.swift
//  Learning SwiftUI
//
//  Created by Leo Yousif on 9/8/21.
//

import SwiftUI

struct Home: Page {
    var geometry: GeometryProxy
    
    var defaultCardSize: CGSize {
        CGSize(
            width: 100, height: (geometry.size.height - 40.0) / 2.00
        )
    }
    
    var body: some View {
        VStack {
            Pie(
                startAngle: Angle(degrees: -90),
                endAngle: Angle(degrees: 90)
            ).modifier(
                DefaultPageCard(
                    defaultCardSize: defaultCardSize
                )
            )
            
            Pie(
                startAngle: Angle(degrees: -90),
                endAngle: Angle(degrees: 90)
            ).modifier(
                DefaultPageCard(
                    defaultCardSize: defaultCardSize
                )
            )
            Text("hello").modifier(
                DefaultPageCard(
                    defaultCardSize: defaultCardSize
                )
            )
        }.padding()
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader {geometry in
            Home(geometry: geometry)
        }
        
    }
}
