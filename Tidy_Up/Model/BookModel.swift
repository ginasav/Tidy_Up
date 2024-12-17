//
//  BookModel.swift
//  Tidy_Up
//
//  Created by Gina Saviano on 09/12/24.
//

import Foundation

struct BookModel: Identifiable {
    let id: UUID = UUID()
    var title: String
    var author: String
    
    var pages: Int
    
    var hardCover: Bool
    
    // Thickness of the book
    var thickness: Double {
        // I assume that the thickness of 1 page is = 0.005 cm
        return (Double(pages) * 0.005) + (hardCover ? 0.25 : 0.0)
    }
}
