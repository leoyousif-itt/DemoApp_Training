//
//  Home.swift
//  Learning SwiftUI
//
//  Created by Leo Yousif on 9/8/21.
//

import SwiftUI

struct Home: View {
    var geometry: GeometryProxy
    
    var body: some View {
        VStack {
            Text("home Page")
                .frame(minWidth: 0, idealWidth: 100, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: geometry.size.height-50.0, maxHeight: geometry.size.height-40.0, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding().cardify()
           Text("home Page").cardify()
                .frame(minWidth: 0, idealWidth: 100, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: geometry.size.height-50.0, maxHeight: geometry.size.height-50.0, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding([.horizontal, .bottom])
    

            
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
