//
//  StarView.swift
//  SparProject
//
//  Created by Gleb Rasskazov on 02.02.2024.
//

import SwiftUI

struct StarView: View {
    var filledStars: Int
    var of: Int
    
    init(
        filledStars: Int,
        of: Int = 5
    ) {
        self.filledStars = filledStars
        self.of = of
    }

    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<of, id: \.self) { index in
                Images.star
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: Component.quadrupleModule, height: Component.quadrupleModule)
                    .foregroundColor(index < filledStars ? DesignColor.gold : DesignColor.gray200)
            }
        }
    }
}
