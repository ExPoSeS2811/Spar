//
//  ReviewView.swift
//  SparProject
//
//  Created by Gleb Rasskazov on 02.02.2024.
//

import SwiftUI

struct ReviewCell: View {
    let review: Product.Review
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: Component.module) {
                headerSection
                StarView(filledStars: review.rating)
                contentSection
                Spacer()
            }
            Spacer()
        }
        .padding(.horizontal)
        .padding(.top, 24)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: Component.tripleModule))
        .shadow(color: Color.black.opacity(0.2), radius: 7)
        .frame(width: 290, height: 180)
        .padding(.leading)
    }
}

private extension ReviewCell {
    var headerSection: some View {
        VStack(alignment: .leading, spacing: Component.module) {
            Text(review.author)
                .font(.headline)
            Text(review.date)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
    }
    
    var contentSection: some View {
        Text(review.text)
            .lineLimit(2)
            .font(.body)
    }
}
