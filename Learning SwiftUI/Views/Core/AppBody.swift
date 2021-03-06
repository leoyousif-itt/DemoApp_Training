//
//  AppBody.swift
//  Learning SwiftUI
//
//  Created by Leo Yousif on 9/11/21.
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
struct AppBody: View {
    @ObservedObject var viewModel: ContentViewModel
    
    @ViewBuilder func generatePage(appGeometry: GeometryProxy, bodyGeometry:GeometryProxy) -> some View {
        CurrentPage(currentPage: viewModel.currentPage, geometry: bodyGeometry){ geometry in
            Home(geometry: geometry)
        } renderPage1: { geometry in
            Page1(geometry: geometry)
        } renderPage2: {geometry in
            Page2(geometry: geometry)
        }.safeView(geometry: appGeometry, ignoreTop: true)
    }
    
    @ViewBuilder private func generateCurrentPage(geometry: GeometryProxy) -> some View {
        GeometryReader { bodyGeometry in
            ScrollView {
                generatePage(appGeometry: geometry, bodyGeometry: bodyGeometry)
            }
        }
    }
    
    @ViewBuilder private func renderBasicAppBody(geometry: GeometryProxy) -> some View {
        ZStack {
            VStack {
                generateTopNav(viewModel)
                    .safeView(geometry: geometry, ignoreTop: false)
                
                generateCurrentPage(geometry: geometry)
                    .background(Color.white)
                generateBottomNav(viewModel)
                    .safeView(geometry: geometry, ignoreTop: true)
            }.background(Color.blue).ignoresSafeArea()
        }
    }
    
    @ViewBuilder private func renderAppBodyIfMenuOpened<Content: View>(geometry: GeometryProxy, item: Content) -> some View
    {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)){
            item
                .disabled(true).opacity(0.75).onTapGesture {
                    if viewModel.sideMenuOpened {
                        viewModel.sideMenuOpened.toggle()
                    }
                }
            LeftMenu(geometry: geometry)
            
        }
    }
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                let item = renderBasicAppBody(geometry: geometry)
                
                if(viewModel.sideMenuOpened){
                    renderAppBodyIfMenuOpened(geometry: geometry, item: item)
                }
                else{
                    item
                }
            }
        }
    }
}

struct AppBody_Previews: PreviewProvider {
    static var previews: some View {
        AppBody(viewModel: ContentViewModel())
    }
}
