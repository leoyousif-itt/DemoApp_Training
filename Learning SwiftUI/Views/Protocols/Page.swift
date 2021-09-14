//
//  Page.swift
//  Learning SwiftUI
//
//  Created by Leo Yousif on 9/14/21.
//

import SwiftUI

protocol Page: View {
    var geometry: GeometryProxy { get set }
    var defaultCardSize: CGSize { get }
}

