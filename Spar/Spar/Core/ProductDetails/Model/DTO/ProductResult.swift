//
//  ProductResult.swift
//  SparProject
//
//  Created by Gleb Rasskazov on 02.02.2024.
//

import Foundation

struct ProductResult: Decodable {
    let name: String
    let rating: Double
    let discount: String?
    let origin: LocationResult
    let description: String
    let characteristics: [String: String]
    let reviews: [ReviewResult]?
    let imageUrl: String
    let oldPrice: Double?
    let priceKg: Double
    let priceUnit: Double
    
    enum CodingKeys: String, CodingKey {
        case name
        case rating
        case discount
        case origin
        case description
        case characteristics
        case reviews
        case imageUrl = "image_url"
        case oldPrice = "old_price"
        case priceKg = "price_kg"
        case priceUnit = "price_unit"
    }
    
    struct LocationResult: Decodable {
        let name: String
        let imageUrl: String
        
        enum CodingKeys: String, CodingKey {
            case name
            case imageUrl = "image_url"
        }
    }
    
    struct ReviewResult: Decodable {
        let author: String
        let date: Double
        let text: String
        let rating: Int
    }
}
