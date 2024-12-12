//
//  CalculationView.swift
//  Tidy_Up
//
//  Created by Gina Saviano on 11/12/24.
//

import SwiftUI

struct BooksFitView: View {
    
    @State var shelfLength: Double = 0.0
    @State var bookCount: Int = 0
    
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
                        
                        Text("\(bookCount)")
                            .font(.title3)
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                        
                    } //Books that fit
                    .padding()
                }
                
            }
            .navigationBarTitle("Books that fit")
            .navigationBarTitleTextColor(.white)
            
        }
        
    }
}

//MARK: PREVIEW
#Preview {
    BooksFitView()
}
