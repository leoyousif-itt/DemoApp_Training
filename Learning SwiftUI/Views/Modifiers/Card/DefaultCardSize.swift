//
//  DefaultCardSize.swift
//  Learning SwiftUI
//
//  Created by Leo Yousif on 9/12/21.
//

import SwiftUI

struct DefaultPageCard: ViewModifier{
    var defaultCardSize: CGSize
    
    func body(content: Content) -> some View {
        content
            .padding()
            .cardify()
            .frame(
                minWidth: 0,
                idealWidth: 100,
                maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
                minHeight: defaultCardSize.height,
                idealHeight: defaultCardSize.height,
                maxHeight:defaultCardSize.height,
                alignment: .center
            )
    }
}
