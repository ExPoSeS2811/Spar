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
    let hint: TagTypeResult?
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
        case hint
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
    
    enum TagTypeResult: Decodable {
        case new
        case priceHit
        case superPrice
        case cardPrice
        case cheaperOnline
        
        init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            let tagTypeString = try container.decode(String.self)
            
            switch tagTypeString.lowercased() {
            case "new": self = .new
            case "price_hit": self = .priceHit
            case "super_price": self = .superPrice
            case "card_price": self = .cardPrice
            case "cheaper_online": self = .cheaperOnline
            default:
                throw DecodingError.dataCorruptedError(in: container, debugDescription: "Unknown tag type")
            }
        }
    }
}
