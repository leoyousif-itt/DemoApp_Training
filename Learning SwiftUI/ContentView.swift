//
//  ContentView.swift
//  Learning SwiftUI
//
//  Created by Leo Yousif on 9/8/21.
//

import SwiftUI

protocol PContentView: View { 
    var viewModel: ContentViewModel { get }
}

struct ContentView: PContentView {
    var viewModel: ContentViewModel
    
    var body: some View {
        AppBody(viewModel: viewModel)
    }
}
