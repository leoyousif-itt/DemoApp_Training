//
//  ContentViewModel.swift
//  Learning SwiftUI
//
//  Created by Leo Yousif on 9/10/21.
//

import SwiftUI

class ContentViewModel: ObservableObject {
    
    @Published var currentPage: AppPage = .home
    @Published var sideMenuOpened: Bool = false

    func changePage(_ newPage: AppPage) -> Void {
        currentPage = newPage
        sideMenuOpened = false
    }
}
