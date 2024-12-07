//
//  Untitled.swift
//  Tidy_Up
//
//  Created by Gina Saviano on 07/12/24.
//

import SwiftUI

struct LibraryView: View {
    //MARK: BODY
    var body: some View {
   
            ZStack {
                Color.background.ignoresSafeArea()
                
                VStack(alignment: .leading) {
                    Text("My Shelves")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.white)
                }
            }
        }
    
    }//MARK: - END OF BODY


//MARK: PREVIEW
#Preview {
    LibraryView()
}

