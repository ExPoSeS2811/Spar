//
//  ContentView.swift
//  SparProject
//
//  Created by Gleb Rasskazov on 31.01.2024.
//

import SwiftUI

struct ProductDetailsView: View {
    @ObservedObject var viewModel: ProductViewModel
    private let jsonName: String
    
    init(
        viewModel: ProductViewModel,
        jsonName: String = "2" // change the number for checking
    ) {
        self.viewModel = viewModel
        self.jsonName = jsonName
    }
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                if viewModel.isLoading {
                    ProgressView()
                } else if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                } else if let product = viewModel.product {
                    ScrollView {
                        Divider()
                        VStack(alignment: .leading, spacing: Component.quadrupleModule) {
                            PreviewProductSectionView(product: product)
                            CharacteristicsProductSectionView(product: product)
                            ReviewProductSectionView(reviews: product.reviews)
                            Spacer()
                        }
                    }
                    .padding(.bottom, 100)
                    .navigationBarItems(
                        leading: leftMenu,
                        trailing: rightMenu
                    )
                    
                    priceView
                }
            }
        }
        .onAppear {
            viewModel.fetchProduct(from: jsonName)
        }
    }
}

extension ProductDetailsView {
    private var leftMenu: some View {
        Images.System.backArrow
            .font(.headline)
            .foregroundColor(DesignColor.toxic)
    }
    
    private var rightMenu: some View {
        HStack(alignment: .firstTextBaseline, spacing: Component.doubleModule) {
            Images.System.bill
            Images.System.share
            Images.System.favorite
        }
        .font(.headline)
        .foregroundColor(DesignColor.toxic)
    }
    
    @ViewBuilder
    private var priceView: some View {
        if let product = viewModel.product {
            PriceProductSectionView(product: product)
                .frame(height: 128)
                .background(Color.white)
                .overlay(
                    VStack {
                        LinearGradient(gradient: Gradient(colors: [.black.opacity(0.1), .clear]), startPoint: .bottom, endPoint: .top)
                            .frame(height: 3)
                        Spacer()
                    }
                )
        } else {
            EmptyView()
        }
    }
}
