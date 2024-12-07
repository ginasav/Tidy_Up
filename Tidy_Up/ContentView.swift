//
//  ContentView.swift
//  Tidy_Up
//
//  Created by Gina Saviano on 07/12/24.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor.white
    }
    
    var body: some View {
        TabView {
            Tab("Your Library", systemImage: "books.vertical.fill") {
                LibraryView()
            }
            
            Tab("Add Book", systemImage: "plus.app") {
                
            }
            
            Tab("Tidy Up", systemImage: "ruler.fill") {
                
            }
        }
    }
}

#Preview {
    ContentView()
}
