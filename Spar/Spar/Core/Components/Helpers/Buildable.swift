//
//  Buildable.swift
//  SparProject
//
//  Created by Gleb Rasskazov on 01.02.2024.
//

import Foundation

protocol Buildable {
    func map(_ closure: (inout Self) -> Void) -> Self
}

extension Buildable {
    func map(_ closure: (inout Self) -> Void) -> Self {
        var copy = self
        closure(&copy)
        return copy
    }
}
