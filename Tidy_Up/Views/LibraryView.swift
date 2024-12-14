//
//  Untitled.swift
//  Tidy_Up
//
//  Created by Gina Saviano on 07/12/24.
//

import SwiftUI

struct LibraryView: View {
    
    @State var showModal: Bool = false
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
                                
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text(book.title)
                                            .font(.headline)
                                        Text("by \(book.author)")
                                            .font(.subheadline)
                                    }
                                    
                                    Spacer()
                                    
                                    Text("\(book.thickness, specifier: "%.2f") cm")
                                        .font(.headline)
                                }
                                .foregroundStyle(.white)
                            }
                            .onDelete(perform: shelfViewModel.delete)
                            .listRowBackground(Color.background)
                        }
                        .scrollContentBackground(.hidden)
                    }
                } //make it changable from library
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
            }
            .sheet(isPresented: $showModal) {
                BooksInputView(showModal: $showModal, addBook: { book in
                    shelfViewModel.addBook(book)
                })
            }
            
        }
        
        
    } //MARK: - END OF BODY
}



//MARK: PREVIEW
#Preview {
    LibraryView()
        .environmentObject(ShelfViewModel())
}

