//
//  TabItem.swift
//  SparProject
//
//  Created by Gleb Rasskazov on 01.02.2024.
//

import SwiftUI

enum TabItem: String, CaseIterable {
    case main
    case catalog
    case cart
    case profile
    
    var image: Image {
        return Image(self.rawValue).renderingMode(.template)
    }
    
    var text: Text {
        switch self {
        case .main: return Text(Labels.TabItem.main)
        case .catalog: return Text(Labels.TabItem.catalog)
        case .cart: return Text(Labels.TabItem.cart)
        case .profile: return Text(Labels.TabItem.profile)
        }
    }
    
    @ViewBuilder
    var screen: some View {
        switch self {
        case .main: ProductDetailsView(viewModel: ProductViewModel())
        case .catalog: CatalogView()
        case .cart: CartView()
        case .profile: ProfileView()
        }
    }
}
