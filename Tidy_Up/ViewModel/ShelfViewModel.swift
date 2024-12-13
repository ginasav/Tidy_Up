//
//  BookViewModel.swift
//  Tidy_Up
//
//  Created by Gina Saviano on 10/12/24.
//

import Foundation
import SwiftUI

@Observable class ShelfViewModel: ObservableObject {
    
    var books : [BookModel] = []
    
    // Functions connected to the Book Class
    func addBook(_ book: BookModel) {
        self.books.insert(book, at: 0)
    }
        
}

