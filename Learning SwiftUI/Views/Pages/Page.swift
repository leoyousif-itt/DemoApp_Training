//
//  Page.swift
//  Learning SwiftUI
//
//  Created by Leo Yousif on 9/11/21.
//

import SwiftUI

enum Page {
    case home
    case page1
    case page2
    
    @ViewBuilder func generatePage(geometry: GeometryProxy) -> some View {
        switch self {
        case .home: Home(geometry: geometry)
        case .page1: Page1()
        case .page2: Page2()
        }
    }
}
