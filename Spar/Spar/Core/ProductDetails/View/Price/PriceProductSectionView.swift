//
//  PriceProductSectionView.swift
//  SparProject
//
//  Created by Gleb Rasskazov on 02.02.2024.
//

import SwiftUI

struct PriceProductSectionView: View {
    @State private var quantity: Int = 1
    @State private var internalSelectedMeasurement: Measurement = .piece
    let product: Product
    
    private var selectedMeasurement: Binding<Measurement> {
        Binding(
            get: { self.internalSelectedMeasurement },
            set: {
                self.internalSelectedMeasurement = $0
                self.quantity = 1
            }
        )
    }
    
    var body: some View {
        VStack(spacing: Component.tripleModule) {
            MeasurementPicker(selectedMeasurement: selectedMeasurement)
            HStack {
                priceView
                Spacer()
                QuantitySelector(
                    quantity: $quantity,
                    measurement: internalSelectedMeasurement, // Use internalSelectedMeasurement for views
                    pricePerPiece: product.priceUnit,
                    pricePerKilogram: product.priceKg
                )
            }
        }
        .padding()
        .edgesIgnoringSafeArea(.bottom)
    }
}

private extension PriceProductSectionView {
    @ViewBuilder
    var priceView: some View {
        VStack(alignment: .leading) {
            currentPrice
            oldPrice
        }
    }
    
    @ViewBuilder
    var currentPrice: some View {
        let pricePerUnit = internalSelectedMeasurement.pricePerUnit(pricePerPiece: product.priceUnit, pricePerKilogram: product.priceKg)
        let unit = internalSelectedMeasurement == .piece ? "₽/шт" : "₽/кг"
        
        HStack {
            Text("\(pricePerUnit, specifier: "%.1f")")
                .font(.system(size: Component.quadrupleModule, weight: .black))
            Text(unit)
                .font(.headline)
                .baselineOffset(Component.module)
        }
    }

    @ViewBuilder
    var oldPrice: some View {
        let currentPricePerUnit = internalSelectedMeasurement.pricePerUnit(pricePerPiece: product.priceUnit, pricePerKilogram: product.priceKg)
        let oldPricePerKg = product.oldPrice ?? 0
        let oldPriceRatio = product.priceKg != 0 ? oldPricePerKg / product.priceKg : 0
        let estimatedOldPrice = currentPricePerUnit * oldPriceRatio
        let unit = internalSelectedMeasurement == .piece ? "₽/шт" : "₽/кг"

        if product.oldPrice != nil {
            Text("\(estimatedOldPrice, specifier: "%.1f") \(unit)")
                .font(.subheadline)
                .strikethrough()
                .foregroundColor(.secondary)
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
