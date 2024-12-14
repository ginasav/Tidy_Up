//
//  Untitled.swift
//  Tidy_Up
//
//  Created by Gina Saviano on 07/12/24.
//

import SwiftUI

struct LibraryView: View {
    
    @State var showModal: Bool = false
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
                                Section () {
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
                            }
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
                    }
                }
                
                
                ToolbarItem (placement: .navigationBarLeading) {
                    Button (action: {
                        editMode = true
                    }) {
                        Text ("Edit")
                    }
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

