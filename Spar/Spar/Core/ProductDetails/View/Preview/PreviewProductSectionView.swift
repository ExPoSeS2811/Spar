//
//  PreviewProductSectionView.swift
//  SparProject
//
//  Created by Gleb Rasskazov on 02.02.2024.
//

import SwiftUI

struct PreviewProductSectionView: View {
    @StateObject var imageLoader: ImageLoader = ImageLoader()
    let product: Product
    
    var body: some View {
        VStack {
            if let image = imageLoader.image {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .frame(height: 300)
                    .overlay(
                        cardPriceTag,
                        alignment: .topLeading
                    )
                    .overlay(
                        reviewSection,
                        alignment: .bottom
                    )
            } else {
                ProgressView()
            }
        }
        .onAppear {
            imageLoader.load(from: product.imageUrl)
        }
    }
}

extension PreviewProductSectionView {
    private var cardPriceTag: some View {
        Text("Цена по карте") // I would do this using enum if I knew what the cases could be or we just use backend :)
            .font(.subheadline)
            .foregroundColor(Color.white)
            .padding(Component.module)
            .background(DesignColor.toxic)
            .clipShape(RoundedRectangle(cornerRadius: Component.halfModule))
            .padding(.leading)
    }
    
    private var reviewSection: some View {
        HStack {
            Images.star
                .renderingMode(.template)
                .foregroundColor(DesignColor.gold)
            Text("\(product.rating, specifier: "%.1f")")
                .foregroundColor(.primary)
            +
            Text(" | \(product.reviews?.count ?? 0) отзывов")
                .foregroundColor(.gray)
            Spacer()
            if let discount = product.discount {
                DiscountTag(title: discount, size: .m)
            }
        }
        .padding(.horizontal)
    }
}
