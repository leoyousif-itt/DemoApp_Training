//
//  Page1.swift
//  Learning SwiftUI
//
//  Created by Leo Yousif on 9/8/21.
//

import SwiftUI

struct Page1: Page {
    var geometry: GeometryProxy
    
    var defaultCardSize: CGSize {
        CGSize(
            width: 100, height: (geometry.size.height - 40.0) / 2.00
        )
    }
    
    var body: some View {
            Text("Page 1").modifier(
                DefaultPageCard(
                    defaultCardSize: defaultCardSize
                )
            ).padding()
        
    }
}

//struct Page1_Previews: PreviewProvider {
//    static var previews: some View {
//        Page1()
//    }
//}
