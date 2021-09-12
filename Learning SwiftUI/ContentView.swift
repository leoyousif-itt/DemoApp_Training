//
//  ContentView.swift
//  Learning SwiftUI
//
//  Created by Leo Yousif on 9/8/21.
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

@ViewBuilder func generateTopNav(_ viewModel: ContentViewModel) -> some View {
    ZStack {
        HStack {
            Button(action: {
                viewModel.sideMenuOpened.toggle()
            }){
                Image(systemName: "ellipsis")
            }
            Spacer()
            Button(action: {
                viewModel.changePage(Page.home)
            }){
                Image(systemName: "stethoscope")
            }
            Spacer()
            Image(systemName: "person")
            
        }.padding(.all, 10.0).foregroundColor(.white)
        
    }
    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 20, maxHeight: 40, alignment: .top)
}

@ViewBuilder func generateBottomNav(_ viewModel: ContentViewModel) -> some View {
    ZStack {
        HStack {
            Button(action: {
                viewModel.changePage(Page.home)
            }){
                Image(systemName: "house")
            }
            Spacer()
            Button(action: {
                viewModel.changePage(Page.page1)
            }){
                Image(systemName: "camera")
            }
            Spacer()
            Button(action: {
                viewModel.changePage(Page.page2)
            }){
                Image(systemName: "gearshape")
            }
            
        }.padding(.all, 10.0).foregroundColor(.white)
    }
    .navigationBarTitle(Text("SwiftUI"))
    .frame(minWidth: 0, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 20, maxHeight: 40, alignment: .top)
}


struct SafeView: ViewModifier {
    var geometry: GeometryProxy
    var ignoreTop: Bool
    
    func body(content: Content) -> some View {
        if(ignoreTop){
            content
                .padding(.bottom, geometry.safeAreaInsets.bottom)
                .padding(.leading, geometry.safeAreaInsets.leading)
                .padding(.trailing, geometry.safeAreaInsets.trailing)
        } else {
            content
                .padding(.top, geometry.safeAreaInsets.top)
                .padding(.leading, geometry.safeAreaInsets.leading)
                .padding(.trailing, geometry.safeAreaInsets.trailing)
        }
        
    }
}

protocol PContentView: View { 
    var viewModel: ContentViewModel { get }
}

struct ContentView: PContentView {
    @ObservedObject var viewModel: ContentViewModel
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                let item = ZStack {
                    VStack {
                        generateTopNav(viewModel).modifier(SafeView(geometry: geometry, ignoreTop: false))
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
                
                if(viewModel.sideMenuOpened){
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
                else{
                    item
                }
            }
        }
    }
}

//struct ContentView_Previews:
//    PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
