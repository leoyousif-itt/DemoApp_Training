//
//  Home.swift
//  Learning SwiftUI
//
//  Created by Leo Yousif on 9/8/21.
//

import SwiftUI

struct DefaultPageCard: ViewModifier{
    var defaultCardSize: CGSize
    
    func body(content: Content) -> some View {
        content
            .padding()
            .cardify()
            .frame(
                minWidth: 0,
                idealWidth: 100,
                maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
                minHeight: defaultCardSize.height,
                idealHeight: defaultCardSize.height,
                maxHeight:defaultCardSize.height,
                alignment: .center
            )
    }
}

struct Home: View {
    var geometry: GeometryProxy
    var defaultCardSize: CGSize {
        CGSize(
            width: 100, height: (geometry.size.height - 40.0) / 2.00)
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
            
            Pie(startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 90))
                .fill(Color.green)
                .padding()
                .cardify()
                .frame(
                    minWidth: 0,
                    idealWidth: 100,
                    maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
                    minHeight: defaultCardSize.height,
                    idealHeight: defaultCardSize.height,
                    maxHeight:defaultCardSize.height,
                    alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
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
