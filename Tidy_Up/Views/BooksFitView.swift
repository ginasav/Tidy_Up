//
//  CalculationView.swift
//  Tidy_Up
//
//  Created by Gina Saviano on 11/12/24.
//

import SwiftUI

struct BooksFitView: View {
    
    @EnvironmentObject var shelfViewModel: ShelfViewModel
    @Environment(\.dismiss) private var dismiss
    var fittingBooks: [BookModel]
    
    var body: some View {
        
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
                        .accessibilityHidden(true)
                    
                    
                } //Books that fit
                .padding()
                .accessibilityLabel("Books that fit \(fittingBooks.count)")
                
                HStack {
                    List(fittingBooks) { book in
                        
                        VStack (alignment: .leading) {
                            Text(book.title)
                                .font(.title2)
                                .foregroundStyle(.white)
                                .fontWeight(.bold)
                            Text(book.author)
                                .font(.subheadline)
                                .foregroundStyle(.white)
                        }
                        
                        //Accessibility for each element of the list
                        .accessibilityElement(children: .combine)
                        .accessibilityLabel("\(book.title) by \(book.author)")
                        
                    }
                    .scrollContentBackground(.hidden)
                }
                
                Button  {
                    dismiss()
                } label: {
                    Text("Done")
                        .foregroundStyle(.white)
                        .padding()
                        .background(Color.gray.opacity(0.6))
                        .cornerRadius(15)
                }
                .accessibilityLabel("Double-tap to dismiss")

                
                
                
                
            }
            
        }
        
        
    }//END OF BODY
}//END OF STRUCT






//MARK: PREVIEW
#Preview {
    BooksFitView(fittingBooks: [
        BookModel(title: "Book Title", author: "Book Author", pages: 100, hardCover: true),
        BookModel(title: "Book Title 2", author: "Book Author", pages: 150, hardCover: true)
    ])
}
