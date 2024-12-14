//
//  BookViewModel.swift
//  Tidy_Up
//
//  Created by Gina Saviano on 10/12/24.
//

import Foundation
import SwiftUI

@Observable class ShelfViewModel: ObservableObject {
    
    var books : [BookModel] = [
        BookModel(title: "Gomorra", author: "Roberto Saviano", pages: 350, hardCover: false),
        BookModel(title: "Accabadora", author: "Michela Murgia", pages: 150, hardCover: false),
        BookModel(title: "L'amica geniale", author: "Elena Ferrante", pages: 300, hardCover: true)
    ]
    
    // Functions connected to the Book Class
    func addBook(_ book: BookModel) {
        self.books.insert(book, at: 0)
    }
    
    func delete(at offsets: IndexSet) {
        self.books.remove(atOffsets: offsets)
    }
        
}

