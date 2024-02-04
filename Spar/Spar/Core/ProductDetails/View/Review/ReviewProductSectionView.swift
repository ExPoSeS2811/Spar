//
//  ReviewProductSectionView.swift
//  SparProject
//
//  Created by Gleb Rasskazov on 02.02.2024.
//

import SwiftUI

struct ReviewProductSectionView: View {
    let reviews: [Product.Review]?
    
    var body: some View {
        VStack(alignment: .leading) {
            reviewHeader
            reviewCarousel
            reviewButton
        }
    }
}

extension ReviewProductSectionView {
    private var reviewHeader: some View {
        HStack {
            Text(Labels.ProductDetails.reviews)
            Spacer()
            Text("\(Labels.ProductDetails.all) \(reviews?.count ?? 0)")
                .foregroundColor(DesignColor.toxic)
        }
        .font(.system(size: 20, weight: .bold))
        .padding(.horizontal)
        
    }
    
    @ViewBuilder
    private var reviewCarousel: some View {
        if let reviews = reviews, reviews.count != 0 {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(reviews.prefix(5)) { review in
                        ReviewCell(review: review)
                    }
                }
                .padding(.vertical, Component.module)
            }
        } else {
            NoReviewsView()
        }
        
    }
    
    private var reviewButton: some View {
        Button(Labels.ProductDetails.sendReview) {
            // action from view model
        }
        .foregroundColor(DesignColor.toxic)
        .font(.system(size: 18, weight: .bold))
        .padding(Component.oneAndHalfModule)
        .frame(maxWidth: .infinity)
        .overlay(
            Capsule()
                .stroke(DesignColor.toxic, lineWidth: 3)
        )
        .padding(.horizontal)
    }
}
