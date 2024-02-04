//
//  PriceProductSectionView.swift
//  SparProject
//
//  Created by Gleb Rasskazov on 02.02.2024.
//

import SwiftUI

struct PriceProductSectionView: View {
    @State private var quantity: Int = 1
    @State private var selectedMeasurement: Measurement = .piece
    let product: Product
    
    var body: some View {
        VStack(spacing: Component.tripleModule) {
            MeasurementPicker(selectedMeasurement: $selectedMeasurement)
            HStack {
                pricePerKgView
                Spacer()
                QuantitySelector(
                    quantity: $quantity,
                    measurement: selectedMeasurement,
                    pricePerPiece: product.priceUnit,
                    pricePerKilogram: product.priceKg
                )
            }
        }
        .padding()
        .edgesIgnoringSafeArea(.bottom)
    }
}

extension PriceProductSectionView {
    var pricePerKgView: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("\(product.priceKg, specifier: "%.1f")")
                    .font(.system(size: Component.quadrupleModule, weight: .black))
                Text("₽/кг")
                    .font(.headline)
                    .baselineOffset(Component.module)
            }
            if let oldPrice = product.oldPrice {
                Text("\(oldPrice, specifier: "%.1f")")
                    .font(.subheadline)
                    .strikethrough()
                    .foregroundColor(.secondary)
            }
        }
    }
}

enum Measurement: String, CaseIterable, Identifiable {
    case piece = "Шт"
    case kilogram = "Кг"
    
    var id: String { self.rawValue }
    
    func pricePerUnit(pricePerPiece: Double, pricePerKilogram: Double) -> Double {
        switch self {
        case .piece:
            return pricePerPiece
        case .kilogram:
            return pricePerKilogram
        }
    }
}
