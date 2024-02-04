//
//  Product.swift
//  SparProject
//
//  Created by Gleb Rasskazov on 02.02.2024.
//

import Foundation

struct Product {
    let name: String
    let rating: Double
    let discount: String?
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
}
