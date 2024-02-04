//
//  QuantitySelector.swift
//  Spar
//
//  Created by Gleb Rasskazov on 04.02.2024.
//

import SwiftUI

struct QuantitySelector: View {
    @Binding var quantity: Int
    var measurement: Measurement
    var pricePerPiece: Double
    var pricePerKilogram: Double
    
    private var price: Double {
        return measurement.pricePerUnit(pricePerPiece: pricePerPiece, pricePerKilogram: pricePerKilogram) * Double(quantity)
    }
    
    var body: some View {
        HStack {
            createButton(for: .decrement)
            Spacer()
            VStack {
                Text("\(quantity) \(measurement.rawValue.lowercased())")
                    .bold()
                Text("\(price, specifier: "%.2f")₽")
                    .font(.footnote)
            }
            Spacer()
            createButton(for: .increment)
        }
        .frame(width: 160)
        .foregroundColor(.white)
        .padding(.vertical, Component.module)
        .padding(.horizontal, Component.doubleModule)
        .background(DesignColor.toxic)
        .clipShape(.capsule)
    }
    
    private func createButton(for quantityAction: QuantityAction) -> some View {
        Button {
            guard quantity + quantityAction.adjustmentValue > 0 else { return }
            quantity += quantityAction.adjustmentValue
        } label: {
            quantityAction.image
                .font(.system(size: 24, weight: .semibold))
        }
    }
}

extension QuantitySelector {
    enum QuantityAction {
        case increment
        case decrement
        
        var image: Image {
            switch self {
            case .increment: return Images.System.plus
            case .decrement: return Images.System.minus
            }
        }
        
        var adjustmentValue: Int {
            switch self {
            case .increment: return 1
            case .decrement: return -1
            }
        }
    }
}
