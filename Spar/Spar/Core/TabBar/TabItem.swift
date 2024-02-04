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
        case .main: return Text("Главная")
        case .catalog: return Text("Каталог")
        case .cart: return Text("Корзина")
        case .profile: return Text("Профиль")
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
