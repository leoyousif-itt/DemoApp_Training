//
//  TopNavBuilder.swift
//  Learning SwiftUI
//
//  Created by Leo Yousif on 9/11/21.
//

import SwiftUI

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

