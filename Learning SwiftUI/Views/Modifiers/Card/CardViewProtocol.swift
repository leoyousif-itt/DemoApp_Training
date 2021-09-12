//
//  CardViewProtocol.swift
//  Learning SwiftUI
//
//  Created by Leo Yousif on 9/8/21.
//

import SwiftUI

protocol CardViewProtocol : ViewModifier {
    var content: String { get set }
    var cornerRaduis: CGFloat { get }
    var color: Color { get set }
    var flipped: Bool { get }
}
