//
//  ImageLoader.swift
//  SparProject
//
//  Created by Gleb Rasskazov on 03.02.2024.
//

import Combine
import SwiftUI

class ImageLoader: ObservableObject {
    @Published var image: Image?
    
    func load(from urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let uiImage = UIImage(data: data) else {
                return
            }
            
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }.resume()
    }
}
