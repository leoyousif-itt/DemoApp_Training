//
//  PCurrentPage.swift
//  Learning SwiftUI
//
//  Created by Leo Yousif on 9/14/21.
//

import SwiftUI

protocol PCurrentPage: View {
    var currentPage: AppPage { get set }
    var geometry: GeometryProxy { get set }
}
