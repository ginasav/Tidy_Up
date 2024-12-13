//
//  CalculationView.swift
//  Tidy_Up
//
//  Created by Gina Saviano on 11/12/24.
//

import SwiftUI

struct BooksFitView: View {
    
    @EnvironmentObject var shelfViewModel: ShelfViewModel
    var fittingBooks: [BookModel]
    
    var body: some View {
        
        NavigationView {
            ZStack {
                Color.background.ignoresSafeArea()
                
                VStack {
                    
                    HStack {
                        
                        Text("Books that fit:")
                            .font(.title3)
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        Text("\(fittingBooks.count)")
                            .font(.title3)
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                        
                    } //Books that fit
                    .padding()
                    
                    HStack {
                        List(fittingBooks) { book in
                            
                            Text(book.title)
                                .font(.title3)
                                .foregroundColor(.black)
                            .fontWeight(.bold)}
                        
                        
                        
                    }
                    
                    Spacer()
                    
                }.padding()
                
                    .scrollContentBackground(.hidden)
                    .listRowBackground(Color.background)
            }
            
        }
        .navigationBarTitle("Books that fit")
        .navigationBarTitleTextColor(.white)
        
    }
}




//MARK: PREVIEW
#Preview {
    BooksFitView(fittingBooks: [
        BookModel(title: "Book Title", author: "Book Author", pages: 100, hardCover: true),
        BookModel(title: "Book Title 2", author: "Book Author", pages: 150, hardCover: true)
    ])
}
