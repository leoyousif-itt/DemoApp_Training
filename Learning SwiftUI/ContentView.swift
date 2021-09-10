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

@ViewBuilder func generateTopNav() -> some View {
    ZStack {
        Rectangle().fill(Color.blue)
        HStack {
            Image(systemName: "ellipsis")
            Spacer()
            Image(systemName: "stethoscope")
            Spacer()
            Image(systemName: "person")
            
        }.padding(.all, 10.0).foregroundColor(.white)
        
    }
    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 20, maxHeight: 40, alignment: .top)
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
    
    @ViewBuilder func generateBottomNav() -> some View {
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
        .navigationBarTitle(Text("SwiftUI")).background(Color.blue)
        .frame(minWidth: 0, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 20, maxHeight: 40, alignment: .top)
    }
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                VStack {
                    generateTopNav().modifier(SafeView(geometry: geometry, ignoreTop: false))
                    Spacer()
                    GeometryReader { bodyGeometry in
                    ScrollView {
                        VStack {
                            viewModel.currentPage.generatePage(geometry: bodyGeometry)
                        }
                    }.frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).background(Color.white)
                    }
                    Spacer()
                    generateBottomNav().modifier(SafeView(geometry: geometry, ignoreTop: true))
                }.background(Color.blue).ignoresSafeArea()
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
