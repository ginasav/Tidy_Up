//
//  CalculationView.swift
//  Tidy_Up
//
//  Created by Gina Saviano on 11/12/24.
//

import SwiftUI

struct BooksFitView: View {
    
    @EnvironmentObject var shelfViewModel: ShelfViewModel
    var booksFitResult: (count: Int, titles: [String])
    
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
                        
                        Text("\(booksFitResult.count)")
                            .font(.title3)
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                        
                    } //Books that fit
                    .padding()
                    
                    HStack {
                        List(booksFitResult.titles, id: \.self) { title in
                            
                            Text(title)
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
    BooksFitView(booksFitResult: (count: 10, titles: ["Gomorra", "Accabadora"]))
}
