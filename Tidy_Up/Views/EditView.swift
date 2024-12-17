//
//  EditView.swift
//  Tidy_Up
//
//  Created by Gina Saviano on 14/12/24.
//

import SwiftUI

struct EditView: View {
    @Binding var editMode: Bool
    
    @EnvironmentObject var shelfViewModel: ShelfViewModel
    @EnvironmentObject var books: ShelfViewModel
    
    
    var body: some View {
        
        NavigationView {
            ZStack {
                Color.background.edgesIgnoringSafeArea(.all)
                
                List {
                    ForEach($shelfViewModel.books) { $book in
                        Section () {
                            if editMode {
                                
                                VStack(alignment: .leading) {
                                    TextField("Book Title", text: $book.title)
                                        .font(.headline)
                                        .keyboardType(.default)
                                        .accessibilityLabel("Title of the book")
                                    TextField("Author", text: $book.author)
                                        .font(.subheadline)
                                        .keyboardType(.default)
                                        .accessibilityLabel("Author of \(book.title)")
                                    TextField("Pages", value: $book.pages, format: .number)
                                        .font(.headline)
                                        .keyboardType(.decimalPad)
                                        .accessibilityLabel("Number of pages of \(book.title)")
                                }
                            }
                        } // Section of each book
                        .foregroundStyle(.white)
                    }
                    .listRowBackground(Color.mySecondary)
                }
                .scrollContentBackground(.hidden)
                .tint(Color.accent)
                .toolbar {
                    ToolbarItem (placement: .navigationBarTrailing) {
                        Button("Save") {
                            editMode = false
                        }
                    }
                    
                    ToolbarItem (placement: .navigationBarLeading) {
                        Button("Cancel") {
                            editMode = false
                        }
                    }
                }
            }
        }
    }
}


//MARK: PREVIEW
#Preview {
    EditView(editMode: .constant(true))
        .environmentObject(ShelfViewModel())
}
