//
//  TopNavBuilder.swift
//  Learning SwiftUI
//
//  Created by Leo Yousif on 9/11/21.
//

import SwiftUI

@ViewBuilder func createTopNavIcons(viewModel: ContentViewModel, image: Image, alignment: Alignment, system: Bool, name: String, action: () -> Any) -> some View {
    GeometryReader { geometry in
        Button(action: {
            viewModel.sideMenuOpened.toggle()
        }){
            Image(systemName: "ellipsis").padding().frame(width: geometry.size.width, height: geometry.size.height, alignment: .leading)
        }
        .frame(width: geometry.size.width, height: geometry.size.height, alignment: .topLeading)
    }
}

@ViewBuilder func generateTopNav(_ viewModel: ContentViewModel) -> some View {
    
    ZStack {
        HStack {
            GeometryReader { geometry in
                Button(action: {
                    viewModel.sideMenuOpened.toggle()
                }){
                    Image(systemName: "ellipsis").padding().frame(width: geometry.size.width, height: geometry.size.height, alignment: .leading)
                }
                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .topLeading)
            }
            
            GeometryReader { geometry in
                Button(action: {
//                    let pageView = EPage<AnyView>.factory(type: .home()){ geometry in
//                        Home(geometry: geometry)
//                    }
//                    viewModel.changePage(pageView)
                }){
                    
//                    Image(systemName: "stethoscope")
                    Image(systemName: "cross.fill").resizable().aspectRatio(contentMode: .fit).frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                    
                }.frame(width: geometry.size.width, height: geometry.size.height, alignment: .topLeading)
            }
            
            GeometryReader { geometry in
                Button(action: {
//                    let pageView = EPage<AnyView>.factory(type: .home()){ geometry in
//                        Home(geometry: geometry)
//                    }
//                    viewModel.changePage(pageView)
                }) {
                    
                    Image(systemName: "person").padding().frame(width: geometry.size.width, height: geometry.size.height, alignment: .trailing)
                    
                }.frame(width: geometry.size.width, height: geometry.size.height, alignment: .topLeading)
            }
            
        }.padding(.all, 10.0).foregroundColor(.white)
    }
    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 20, maxHeight: 40, alignment: .top)
}

