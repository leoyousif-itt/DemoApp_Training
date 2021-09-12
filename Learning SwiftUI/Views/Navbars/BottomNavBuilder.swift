//
//  BottomNavBuilder.swift
//  Learning SwiftUI
//
//  Created by Leo Yousif on 9/11/21.
//

import SwiftUI

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
