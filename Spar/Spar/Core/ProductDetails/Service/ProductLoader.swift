//
//  ProductLoader.swift
//  SparProject
//
//  Created by Gleb Rasskazov on 02.02.2024.
//

import Foundation
import Network

final class ProductLoader {
    typealias ProductHandler = (ProductResult?) -> Void
    
    func load(completion: @escaping ProductHandler) {
        guard let url = Bundle.main.url(forResource: "1", withExtension: "json") else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let product = try JSONDecoder().decode(ProductResult.self, from: data)
            completion(product)
        } catch {
            completion(nil)
        }
    }
}
