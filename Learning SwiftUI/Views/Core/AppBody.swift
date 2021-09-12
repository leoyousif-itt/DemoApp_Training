//
//  AppBody.swift
//  Learning SwiftUI
//
//  Created by Leo Yousif on 9/11/21.
//

import SwiftUI

struct AppBody: View {
    @ObservedObject var viewModel: ContentViewModel
    
    @ViewBuilder func renderBasicItem(geometry: GeometryProxy) -> some View {
        ZStack {
            VStack {
                generateTopNav(viewModel).safeView(geometry: geometry, ignoreTop: false)
                Spacer()
                GeometryReader { bodyGeometry in
                    ScrollView {
                        VStack {
                            viewModel.currentPage.generatePage(geometry: bodyGeometry)
                        }
                    }.frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).background(Color.white)
                }
                Spacer()
                generateBottomNav(viewModel).modifier(SafeView(geometry: geometry, ignoreTop: true))
            }.background(Color.blue).ignoresSafeArea()
        }
    }
    
    @ViewBuilder func renderIfMenuOpened<Content>(geometry: GeometryProxy, item: Content) -> some View
    where Content: View
    {
        item.disabled(true).opacity(0.75).onTapGesture {
            if viewModel.sideMenuOpened {
                viewModel.sideMenuOpened.toggle()
            }
        }
        
        VStack{
            Text("Menu").underline().padding().foregroundColor(.white).modifier(SafeView(geometry: geometry, ignoreTop: false))
            VStack {
                Text("Item 1").foregroundColor(.white).padding(.bottom, 5.00)
                Text("Item 2").foregroundColor(.white).padding(.bottom, 5.00)
                Text("Item 3").foregroundColor(.white).padding(.bottom, 5.00)
                
            }.padding()
            
        }.frame(minWidth: geometry.size.width / 3.00, idealWidth: geometry.size.width / 3.00, maxWidth: geometry.size.width / 3.00, minHeight: 100, idealHeight: .infinity, maxHeight: .infinity, alignment: .top).background(Color.blue).ignoresSafeArea()
    }
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                let item = renderBasicItem(geometry: geometry)
                
                if(viewModel.sideMenuOpened){
                    renderIfMenuOpened(geometry: geometry, item: item)
                        .frame(
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
