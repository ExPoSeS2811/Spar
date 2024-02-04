//
//  Product.swift
//  SparProject
//
//  Created by Gleb Rasskazov on 02.02.2024.
//

import SwiftUI

struct Product {
    let name: String
    let rating: Double
    let discount: String?
    let hint: TagType?
    let origin: Location
    let description: String
    let characteristics: [String: String]
    let reviews: [Review]?
    let imageUrl: String
    let oldPrice: Double?
    let priceKg: Double
    let priceUnit: Double
    
    struct Location {
        let name: String
        let imageUrl: String
    }
    
    struct Review: Identifiable {
        let id: String = UUID().uuidString
        let author: String
        let date: String
        let text: String
        let rating: Int
    }
    
    enum TagType {
        case new
        case priceHit
        case superPrice
        case cardPrice
        case cheaperOnline
        
        var title: String {
            switch self {
            case .new: return Labels.Hint.new
            case .priceHit: return Labels.Hint.priceHit
            case .superPrice: return Labels.Hint.superPrice
            case .cardPrice: return Labels.Hint.cardPrice
            case .cheaperOnline: return Labels.Hint.cheaperOnline
            }
        }
        
        var color: Color { // Domain model should not know about UI :(
            switch self {
            case .new: return DesignColor.violet
            case .priceHit, .superPrice: return DesignColor.crimson
            case .cardPrice: return DesignColor.toxic
            case .cheaperOnline: return DesignColor.ruby
            }
        }
    }
}

