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
    var booksThatFit: [(book: BookModel, count: Int)] = []
    
    // Functions connected to the Book Class
    func addBook(_ book: BookModel) {
        self.books.insert(book, at: 0)
    }
    
    //Overll thickness
    var totalThickness: Double {
        books.reduce(0) { $0 + $1.thickness }
    }
    
    // Calculate how many books fit in the given shelf length
    func calculateBooksThatFit(for shelfLength: Double) -> (count: Int, titles: [String]) {
        let shelfLengthInCm = shelfLength * 100 // Convert meters to cm
        
        // Number of the books that fit
        let booksThatFit = Int(shelfLengthInCm / totalThickness)
        
        // Titles of the books that fit
        let booksTitlesThatFit = books.map { $0.title }
        
        return(booksThatFit, booksTitlesThatFit)
    }
}

