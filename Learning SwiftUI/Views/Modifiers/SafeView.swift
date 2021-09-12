//
//  SafeView.swift
//  Learning SwiftUI
//
//  Created by Leo Yousif on 9/11/21.
//

import SwiftUI

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

extension View {
    func safeView(geometry: GeometryProxy, ignoreTop: Bool) -> some View {
        self.modifier(SafeView(geometry: geometry, ignoreTop: ignoreTop))
    }
}
