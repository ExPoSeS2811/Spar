//
//  CharacteristicsSectionView.swift
//  SparProject
//
//  Created by Gleb Rasskazov on 02.02.2024.
//

import SwiftUI

struct CharacteristicsProductSectionView: View {
    @StateObject private var imageLoader = ImageLoader()
    @State private var showAllCharacteristics: Bool = false
    let product: Product
    
    var body: some View {
        VStack(alignment: .leading, spacing: Component.quadrupleModule) {
            productTitle
            productOrigin
            productDescription
            productCharacteristics
            
            toggleCharacteristicsButton
        }
        .padding(.horizontal)
        .onAppear {
            imageLoader.load(from: product.origin.imageUrl)
        }
    }
}

private extension CharacteristicsProductSectionView {
    var productTitle: some View {
        Text(product.name)
            .font(.system(size: Component.quadrupleModule, weight: .bold))
    }
    
    @ViewBuilder
    var productOrigin: some View {
        HStack {
            if let image = imageLoader.image {
                image
                    .resizable()
                    .frame(width: Component.quadrupleModule, height: Component.quadrupleModule)
                    .clipShape(Circle())
            } else {
                ProgressView()
            }
            Text(product.origin.name)
                .font(.subheadline)
        }
    }
    
    var productDescription: some View {
        VStack(alignment: .leading, spacing: Component.module) {
            Text(Labels.ProductDetails.description)
                .font(.headline)
            Text(product.description)
                .font(.subheadline)
        }
    }
    
    var productCharacteristics: some View {
        VStack(alignment: .leading, spacing: Component.module) {
            Text(Labels.ProductDetails.characteristics)
                .font(.headline)
            VStack(alignment: .leading, spacing: Component.tripleModule) {
                ForEach(Array(product.characteristics.keys.sorted().enumerated()), id: \.element) { index, key in
                    if let value = product.characteristics[key], showAllCharacteristics || index < 5 {
                        DottedLineText(title: key, value: value)
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    var toggleCharacteristicsButton: some View {
        if product.characteristics.count > 5 {
            Button(showAllCharacteristics ? Labels.ProductDetails.hideAllCharacteristics : Labels.ProductDetails.showAllCharacteristics) {
                withAnimation {
                    showAllCharacteristics.toggle()
                }
            }
            .font(.system(size: Component.doubleModule, weight: .bold))
            .foregroundColor(DesignColor.toxic)
        }
    }
}
