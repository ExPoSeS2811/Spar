//
//  CharacteristicsSectionView.swift
//  SparProject
//
//  Created by Gleb Rasskazov on 02.02.2024.
//

import SwiftUI

struct CharacteristicsProductSectionView: View {
    @StateObject var imageLoader = ImageLoader()
    @State var showAllCharacteristics: Bool = false
    let product: Product
    
    var body: some View {
        VStack(alignment: .leading, spacing: Component.quadrupleModule) {
            Text(product.name)
                .font(.system(size: Component.quadrupleModule, weight: .bold))
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
            
            VStack(alignment: .leading, spacing: Component.module) {
                Text("Описание")
                    .font(.headline)
                Text(product.description)
                    .font(.subheadline)
            }
            
            VStack(alignment: .leading, spacing: Component.module) {
                Text("Основные характеристики")
                    .font(.headline)
                
                VStack(alignment: .leading, spacing: Component.tripleModule) {
                    ForEach(Array(product.characteristics.keys.sorted().enumerated()), id: \.element) { index, key in
                        if let value = product.characteristics[key], showAllCharacteristics || index < 5 {
                            DottedLineText(title: key, value: value)
                        }
                    }
                }
            }
            
            if product.characteristics.count > 5 {
                Button(showAllCharacteristics ? "Свернуть" : "Все характеристики") {
                    withAnimation(.bouncy) {
                        showAllCharacteristics.toggle()
                    }
                }
                .font(.system(size: Component.doubleModule, weight: .bold))
                .foregroundColor(DesignColor.toxic)
            }
        }
        .padding(.horizontal)
        .onAppear {
            imageLoader.load(from: product.origin.imageUrl)
        }
        
    }
}
