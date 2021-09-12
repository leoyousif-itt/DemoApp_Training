//
//  LeftMenu.swift
//  Learning SwiftUI
//
//  Created by Leo Yousif on 9/11/21.
//

import SwiftUI

struct LeftMenu: View {
    var geometry: GeometryProxy
    
    var body: some View {
        let menu = VStack{
            Text("Menu").underline().padding().foregroundColor(.white).modifier(SafeView(geometry: geometry, ignoreTop: false))
            VStack {
                Text("Item 1").foregroundColor(.white).padding(.bottom, 5.00)
                Text("Item 2").foregroundColor(.white).padding(.bottom, 5.00)
                Text("Item 3").foregroundColor(.white).padding(.bottom, 5.00)

            }.padding()
            
        }
        
        if UIDevice.current.orientation.isLandscape {
            menu.frame(
                minWidth: geometry.size.width / 4.00,
                idealWidth: geometry.size.width / 4.00,
                maxWidth: geometry.size.width / 4.00,
                minHeight: 100,
                idealHeight: .infinity,
                maxHeight: .infinity,
                alignment: .top)
            .background(Color.blue)
            .ignoresSafeArea()
        } else {
            menu.frame(
                minWidth: geometry.size.width / 3.00,
                idealWidth: geometry.size.width / 3.00,
                maxWidth: geometry.size.width / 3.00,
                minHeight: 100,
                idealHeight: .infinity,
                maxHeight: .infinity,
                alignment: .top)
            .background(Color.blue)
            .ignoresSafeArea()
            
        }
    }
}

//struct LeftMenu_Previews: PreviewProvider {
//    static var previews: some View {
//        LeftMenu()
//    }
//}
