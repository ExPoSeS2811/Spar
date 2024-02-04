//
//  NoReviewView.swift
//  SparProject
//
//  Created by Gleb Rasskazov on 03.02.2024.
//

import SwiftUI

struct NoReviewsView: View {
    var body: some View {
        HStack {
            textContent
            imageView
        }
        .frame(maxWidth: .infinity)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(8)
        .padding()
    }
}

private extension NoReviewsView {
    var textContent: some View {
        VStack(alignment: .leading, spacing: Component.doubleModule) {
            Text(Labels.ProductDetails.noReviews)
                .font(.headline)
            
            Text(Labels.ProductDetails.beFirst)
                .font(.subheadline)
        }
        .padding()
    }
    
    var imageView: some View {
        Images.noReview
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 100)
    }
}
