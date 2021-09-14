//
//  Page2.swift
//  Learning SwiftUI
//
//  Created by Leo Yousif on 9/8/21.
//

import SwiftUI

struct Page2: Page {
    var geometry: GeometryProxy
    
    var defaultCardSize: CGSize {
        CGSize(
            width: 100, height: (geometry.size.height - 40.0) / 2.00
        )
    }
    
    var body: some View {
            Text("Page 2").modifier(
                DefaultPageCard(
                    defaultCardSize: defaultCardSize
                )
            ).padding()
        
    }
}

