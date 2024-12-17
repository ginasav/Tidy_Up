//
//  Untitled.swift
//  Tidy_Up
//
//  Created by Gina Saviano on 07/12/24.
//

import SwiftUI

struct LibraryView: View {
    
    @State private var showModal: Bool = false
    @State private var editMode: Bool = false
    @EnvironmentObject var shelfViewModel: ShelfViewModel
    @EnvironmentObject var books: ShelfViewModel
    
    //MARK: BODY
    var body: some View {
        
        NavigationView {
            ZStack {
                Color.background.ignoresSafeArea()
                
                VStack {
                    
                    if shelfViewModel.books.isEmpty {
                        
                        Text("No Book Added. Click + to add books to your shelves.")
                            .foregroundStyle(.gray).opacity(0.8)
                            .multilineTextAlignment(.center)
                            .font(.title2)
                            .padding(.horizontal, 100)
                    } else {
                        List {
                            ForEach(shelfViewModel.books) { book in
                                
                                VStack {
                                    HStack {
                                        VStack (alignment: .leading) {
                                            Text(book.title)
                                                .font(.headline)
                                            Text("by \(book.author)")
                                                .font(.subheadline)
                                        }
                                        
                                        Spacer ()
                                        
                                        Text (String(format: "%.2f cm", (book.thickness)))
                                            .font(.headline)
                                    }
                                    
                                } // Section of each book
                                .foregroundStyle(.white)
                                //Accessibility for each element of the list
                                .accessibilityElement(children: .combine)
                                .accessibilityLabel("\(book.title) by \(book.author), thickness \(String(format: "%.2f centimeters", book.thickness))")
                                .accessibilityHint("Flick up to delete")
                                
                                
                            }.onDelete(perform: shelfViewModel.delete)
                                .listRowBackground(Color.mySecondary)
                            
                        }
                        .padding(.top, 5)
                        .scrollContentBackground(.hidden)
                        
                        
                        
                    }
                }
            }
            .navigationBarTitle("My Library")
            .navigationBarTitleTextColor(.white)
            .toolbar {
                ToolbarItem (placement: .navigationBarTrailing) {
                    Button (action: {
                        showModal = true
                    }) {
                        Image(systemName: "plus")
                            .font(.title2)
                    }.accessibilityLabel("Add new books")
                        .accessibilityHint("Press to add new books to your library")
                }
                
                
                ToolbarItem (placement: .navigationBarLeading) {
                    Button (action: {
                        editMode = true
                    }) {
                        Text ("Edit")
                    }.accessibilityHint("Edit books you already inserted")
                        .font(.title2)
                        .foregroundStyle(.accent)
                }
            }.sheet(isPresented: $showModal) {
                BooksInputView(showModal: $showModal, addBook: { book in
                    shelfViewModel.addBook(book)
                })
            }
            .sheet(isPresented: $editMode) {
                EditView(editMode: $editMode)
            }
            
            
        }
        
        
    } //MARK: - END OF BODY
}



//MARK: PREVIEW
#Preview {
    LibraryView()
        .environmentObject(ShelfViewModel())
}

