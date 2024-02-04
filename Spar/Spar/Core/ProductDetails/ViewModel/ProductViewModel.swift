//
//  ProductViewModel.swift
//  SparProject
//
//  Created by Gleb Rasskazov on 03.02.2024.
//

import Foundation
import Combine


class ProductViewModel: ObservableObject {
    @Published var product: Product?
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var isFavorite = false
    
    private let converter: ProductDTOToDomainConverter
    
    private var cancellables = Set<AnyCancellable>()
    
    init(converter: ProductDTOToDomainConverter = ProductDTOToDomainConverter()) {
        self.converter = converter
    }
    
    func fetchProduct(from resourceName: String) {
        guard let url = Bundle.main.url(forResource: resourceName, withExtension: "json") else { return }
        
        self.isLoading = true
        self.errorMessage = nil
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: ProductResult.self, decoder: JSONDecoder())
            .map { self.converter.convert($0) }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    self?.isLoading = false
                case .failure(let error):
                    self?.isLoading = false
                    self?.errorMessage = error.localizedDescription
                }
            } receiveValue: { [weak self] product in
                self?.product = product
            }
            .store(in: &self.cancellables)
    }
    
    func toggleFavorite() {
        isFavorite.toggle()
    }
}
