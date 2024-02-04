//
//  MainTabView.swift
//  SparProject
//
//  Created by Gleb Rasskazov on 01.02.2024.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab: TabItem = .main
    
    var body: some View {
        TabView(selection: $selectedTab) {
            ForEach(TabItem.allCases, id: \.self) { item in
                item.screen
                    .tabItem {
                        item.image
                        item.text
                    }
                    .tag(item)
            }
        }
        .accentColor(DesignColor.toxic)
        .background(Color.white)
    }
}
