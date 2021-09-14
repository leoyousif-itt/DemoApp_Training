//
//  CurrentPage.swift
//  Learning SwiftUI
//
//  Created by Leo Yousif on 9/13/21.
//

import SwiftUI

struct CurrentPage<HomeView: Page, Page1View: Page, Page2View: Page>:PCurrentPage {
    var currentPage: AppPage
    var geometry: GeometryProxy
    
    var renderHome: (_ geometry: GeometryProxy) -> HomeView
    var renderPage1: (_ geometry: GeometryProxy) -> Page1View
    var renderPage2: (_ geometry: GeometryProxy) -> Page2View
    
    @ViewBuilder func renderCurrentPage() -> some View {
        switch currentPage {
        
        case .home: renderHome(geometry)
        case .page1: renderPage1(geometry)
        case .page2: renderPage2(geometry)
        }
    }
    
    var body: some View {
        renderCurrentPage()
    }
}

//struct CurrentPage_Previews: PreviewProvider {
//    static var previews: some View {
//        CurrentPage()
//    }
//}
