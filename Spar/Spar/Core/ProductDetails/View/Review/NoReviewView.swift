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
            VStack(alignment: .leading, spacing: 16) {
                Text("У товара пока нет оценок и отзывов")
                    .font(.headline)
                
                Text("Станьте первым! Вы можете оценить товар, нажав на кнопку ниже")
                    .font(.subheadline)
            }
            .padding()

            
            Images.noReview
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100)
        }
        .frame(maxWidth: .infinity)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(8)
        .padding()
    }
}
