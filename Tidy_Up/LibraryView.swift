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
        
        NavigationView {
            ZStack {
                Color.background.ignoresSafeArea()
            }
            .navigationBarTitle("My Shelves")
            .navigationBarTitleTextColor(.white)
        }
    } //MARK: - END OF BODY
}



//MARK: PREVIEW
#Preview {
    LibraryView()
}

