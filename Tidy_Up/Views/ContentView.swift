//
//  ContentView.swift
//  Tidy_Up
//
//  Created by Gina Saviano on 07/12/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var shelfViewModel = ShelfViewModel()
    
    init() {
        UITabBar.appearance().unselectedItemTintColor = .unselectedIcons
    }
    
    var body: some View {
        TabView {
            Tab("Your Library", systemImage: "books.vertical.fill") {
                LibraryView()
            }
            
            Tab("Tidy Up", systemImage: "ruler.fill") {
                MeasureView()
            }
        }
        .environmentObject(shelfViewModel)
    }
}

#Preview {
    ContentView()
}
