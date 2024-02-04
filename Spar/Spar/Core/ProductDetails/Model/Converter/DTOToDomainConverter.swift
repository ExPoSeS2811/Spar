//
//  DTOToDomainConverter.swift
//  SparProject
//
//  Created by Gleb Rasskazov on 02.02.2024.
//

import Foundation

struct ProductDTOToDomainConverter {
    func convert(_ dto: ProductResult?) -> Product? {
        guard let name = dto?.name,
              let rating = dto?.rating,
              let origin = dto?.origin,
              let description = dto?.description,
              let characteristics = dto?.characteristics,
              let imageUrl = dto?.imageUrl,
              let priceKg = dto?.priceKg,
              let priceUnit = dto?.priceUnit else { return nil }
        
        return Product(
            name: name,
            rating: rating,
            discount: dto?.discount,
            hint: convert(from: dto?.hint),
            origin: convert(from: origin),
            description: description,
            characteristics: characteristics,
            reviews: dto?.reviews?.map(convert(from:)),
            imageUrl: imageUrl,
            oldPrice: dto?.oldPrice,
            priceKg: priceKg,
            priceUnit: priceUnit
        )
    }
    
    private func convert(from value: ProductResult.LocationResult) -> Product.Location {
        return Product.Location(
            name: value.name,
            imageUrl: value.imageUrl
        )
    }
    
    private func convert(from value: ProductResult.ReviewResult) -> Product.Review {
        return Product.Review(
            author: value.author,
            date: convert(from: value.date),
            text: value.text,
            rating: value.rating
        )
    }
    
    private func convert(from value: Double) -> String {
        let russianLocale = Locale(identifier: "ru_RU")
        
        let date = Date(timeIntervalSince1970: value)
        let formatter = DateFormatter()
        formatter.locale = russianLocale
        formatter.dateFormat = "d MMMM yyyy"
        return formatter.string(from: date)
    }
    
    private func convert(from value: ProductResult.TagTypeResult?) -> Product.TagType? {
        guard let value = value else { return nil }
        
        switch value {
        case .new: return .new
        case .priceHit: return .priceHit
        case .superPrice: return .superPrice
        case .cardPrice: return .cardPrice
        case .cheaperOnline: return .cheaperOnline
        }
    }
}
