//
//  ContentViewModel.swift
//  Learning SwiftUI
//
//  Created by Leo Yousif on 9/10/21.
//

import SwiftUI


/**
 Another description
 
 More description
 
 - important: Make sure you read this
 - returns: a Llama spotter rating between 0 and 1 as a Float
 - parameter by: The number of Llamas spotted on the trip
 - version: 1.0
 
 Even more description
 */
class ContentViewModel: ObservableObject {
    
    @Published var currentPage: AppPage = .home
    @Published var sideMenuOpened: Bool = false

    func changePage(_ newPage: AppPage) -> Void {
        currentPage = newPage
        sideMenuOpened = false
    }
}
