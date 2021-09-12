//
//  AppBody.swift
//  Learning SwiftUI
//
//  Created by Leo Yousif on 9/11/21.
//

import SwiftUI

struct AppBody: View {
    @ObservedObject var viewModel: ContentViewModel
    
    @ViewBuilder private func generateCurrentPage() -> some View {
        GeometryReader { bodyGeometry in
            ScrollView {
                viewModel.currentPage.generatePage(geometry: bodyGeometry)
               
            }
        }
    }
    
    @ViewBuilder private func renderBasicAppBody(geometry: GeometryProxy) -> some View {
        ZStack {
            VStack {
                generateTopNav(viewModel)
                    .safeView(geometry: geometry, ignoreTop: false)
                
                generateCurrentPage()
                    .frame(
                        minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,
                        idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,
                        maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
                        minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,
                        idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,
                        maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
                        alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
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
