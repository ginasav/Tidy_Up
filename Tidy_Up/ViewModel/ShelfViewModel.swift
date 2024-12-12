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
    var booksThaFit: [(book: BookModel, count: Int)] = []
    
    // Functions connected to the Book Class
    func addBook(_ book: BookModel) {
        self.books.insert(book, at: 0)
    }
    
    // Calculate how many books fit in the given shelf length
    func calculateBooksThatFit(for shelfLength: Double) {
            let shelfLengthInCm = shelfLength * 100 // Convert meters to cm
            booksThatFit = books.map { book in
                let count = Int(shelfLengthInCm / book.thickness)
                return (book, count)
            }
        }
    
}
