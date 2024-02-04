//
//  PreviewProductSectionView.swift
//  SparProject
//
//  Created by Gleb Rasskazov on 02.02.2024.
//

import SwiftUI

struct PreviewProductSectionView: View {
    @StateObject private var imageLoader = ImageLoader()
    let product: Product
    
    var body: some View {
        VStack {
            contentBasedOnImageLoading
        }
        .onAppear {
            imageLoader.load(from: product.imageUrl)
        }
    }
}

private extension PreviewProductSectionView {
    @ViewBuilder
    var contentBasedOnImageLoading: some View {
        if let image = imageLoader.image {
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .frame(height: 300)
                .overlay(cardPriceTag, alignment: .topLeading)
                .overlay(reviewSection, alignment: .bottom)
        } else {
            ProgressView()
        }
    }
    
    @ViewBuilder
    var cardPriceTag: some View {
        if let hint = product.hint {
            Text(hint.title)
                .font(.system(size: 14))
                .foregroundColor(.white)
                .padding(.vertical, Component.halfModule)
                .padding(.horizontal, Component.module)
                .background(hint.color)
                .clipShape(RoundedRectangle(cornerRadius: Component.halfModule))
                .padding(.leading)
        }
    }
    
    var reviewSection: some View {
        HStack {
            Images.star
                .renderingMode(.template)
                .foregroundColor(DesignColor.gold)
            Text("\(product.rating, specifier: "%.1f")")
                .foregroundColor(.primary)
            +
            Text(" | \(product.reviews?.count ?? 0) \(Labels.ProductDetails.countOfReviews)")
                .foregroundColor(.gray)
            Spacer()
            if let discount = product.discount {
                DiscountTag(title: discount, size: .m)
            }
        }
        .padding(.horizontal)
    }
}
