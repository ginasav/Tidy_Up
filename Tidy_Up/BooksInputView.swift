//
//  BooksThatFitView.swift
//  Tidy_Up
//
//  Created by Gina Saviano on 10/12/24.
//

import SwiftUI

struct BooksInputView: View {
    
    // Variables user input
    @State var title: String = ""
    @State var author: String = ""
    @State var pages: Int = 0
    @State var hardCover: Bool = false
    
    @Binding var showModal: Bool
        
    var addBook: (_ book: BookModel) -> Void
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.background.ignoresSafeArea()
                
                Form {
                    Section ("Title") {
                        TextField("Book's Title", text: $title)
                    }.foregroundStyle(Color.white)
                        .listRowBackground(Color.gray)
                    
                    Section ("Author") {
                        TextField("Book's Author", text: $author)
                    }.foregroundStyle(Color.white)
                        .listRowBackground(Color.gray)
                    
                    Section ("Pages") {
                        TextField("Book's Pages", value: $pages, formatter: NumberFormatter())
                            .keyboardType(.numberPad)
                    }.foregroundStyle(Color.white)
                        .listRowBackground(Color.gray)
                    
                    Section ("Hard Cover") {
                        Toggle("Hard Cover", isOn: $hardCover)
                            .foregroundStyle(.tertiary)
                    } .foregroundStyle(Color.white)
                        .listRowBackground(Color.gray)
                    
                    Button ("Add Another Book") {
                        let newBook = BookModel(title: title, author: author, pages: pages, hardCover: hardCover)
                        clearForm()
                    }
                    .listRowBackground(Color.accentColor).foregroundStyle(Color.black.opacity(0.8)).fontWeight(.bold).padding(.horizontal, 80)
                    
                }.scrollContentBackground(.hidden)
                    .tint(Color.accent)
                    .toolbar {
                        ToolbarItem(placement: .topBarLeading) {
                            Button("Back") {
                                showModal.toggle()
                            }
                        }
                        
                        
                        ToolbarItem(placement: .topBarTrailing) {
                            Button("Done") {
                                let newBook = BookModel(title: title, author: author, pages: pages, hardCover: hardCover)
                                addBook(newBook)
                                showModal.toggle()
                            }
                            
                            
                        }
                    
                    }
                    .navigationTitle("Add Book Details")
                    .navigationBarTitleTextColor(.white)
            } //MARK: END OF ZSTACK
            
        }
    }
    
    private func clearForm() {
        title = ""
        author = ""
        pages = 0
        hardCover = false
    }
    
}

//MARK: Preview
#Preview {
    BooksInputView(showModal: .constant(true),
        
        addBook: { book in
    })
}
