//
//  Untitled.swift
//  Tidy_Up
//
//  Created by Gina Saviano on 07/12/24.
//

import SwiftUI

struct LibraryView: View {
    
    @State var showModal: Bool = false
    @State var shelfViewModel = ShelfViewModel()
    
    //MARK: BODY
    var body: some View {
        
        NavigationView {
            ZStack {
                Color.background.ignoresSafeArea()
                
                VStack {
                    Text("Click + to add books to your shelf")
                        .foregroundStyle(.gray).opacity(0.8)
                        .multilineTextAlignment(.center)
                        .font(.title2)
                }.padding(.horizontal, 100)
            }
            .navigationBarTitle("My Shelves")
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
}

