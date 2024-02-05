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
    
    init(viewModel: ProductViewModel, jsonName: String = "2") { // change the value, for check another examples
        self.viewModel = viewModel
        self.jsonName = jsonName
    }
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                contentView
                priceView
            }
        }
        .onAppear {
            viewModel.fetchProduct(from: jsonName)
        }
    }
}

private extension ProductDetailsView {
    @ViewBuilder
    var contentView: some View {
        if viewModel.isLoading {
            ProgressView()
        } else if let errorMessage = viewModel.errorMessage {
            Text(errorMessage)
                .foregroundColor(.red)
        } else if viewModel.product != nil {
            productContentView
        }
    }
    
    @ViewBuilder
    var productContentView: some View {
        ScrollView {
            if let product = viewModel.product {
                Divider()
                VStack(alignment: .leading, spacing: Component.quadrupleModule) {
                    PreviewProductSectionView(product: product)
                    CharacteristicsProductSectionView(product: product)
                    ReviewProductSectionView(reviews: product.reviews)
                    Spacer()
                }
                .padding(.bottom, 100)
                .navigationBarItems(leading: leftMenu, trailing: rightMenu)
            }
        }
    }
    
    var leftMenu: some View {
        Images.System.backArrow
            .font(.headline)
            .foregroundColor(DesignColor.toxic)
    }
    
    var rightMenu: some View {
        HStack(alignment: .firstTextBaseline, spacing: Component.doubleModule) {
            Images.System.bill
            Images.System.share
            Button(action: viewModel.toggleFavorite) {
                viewModel.isFavorite ? Images.System.favoriteFill : Images.System.favoriteOutline
            }
        }
        .font(.headline)
        .foregroundColor(DesignColor.toxic)
    }
    
    @ViewBuilder
    var priceView: some View {
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
                .edgesIgnoringSafeArea(.bottom)
        }
    }
}
