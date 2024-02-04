//
//  Component.swift
//  SparProject
//
//  Created by Gleb Rasskazov on 03.02.2024.
//

import Foundation

struct Component {
    /// 2
    static var quarterModule: CGFloat { halfModule * 0.5 }
    /// 4
    static let halfModule: CGFloat = 4
    /// 6
    static var threeQuartersModule: CGFloat { halfModule * 1.5 }
    /// 8
    static var module: CGFloat { halfModule * 2 }
    /// 12
    static var oneAndHalfModule: CGFloat { module * 1.5 }
    /// 16
    static var doubleModule: CGFloat { module * 2 }
    /// 24
    static var tripleModule: CGFloat { module * 3 }
    /// 32
    static var quadrupleModule: CGFloat { doubleModule * 2 }
}
