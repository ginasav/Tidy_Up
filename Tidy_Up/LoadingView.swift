//
//  LoadingView.swift
//  Tidy_Up
//
//  Created by Gina Saviano on 07/12/24.
//

import SwiftUI

struct LoadingView: View {

    @State private var showAnimation: Bool = false

    //MARK: BODY
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
     
            VStack {
                HStack(alignment: .bottom) {
                    Image("Book1")
                        .offset(x: 0, y: showAnimation ? 0 : -50)
                        .animation(
                            .interpolatingSpring(stiffness: 100, damping: 5)
                            .repeatForever(autoreverses: false).delay(0.02),
                            value: showAnimation
                        )
                    
                    Image("Book3")
                        .offset(x: 0, y: showAnimation ? 0 : -50)
                        .animation(
                            .interpolatingSpring(stiffness: 100, damping: 5)
                            .repeatForever(autoreverses: false).delay(0.04),
                            value: showAnimation
                        )
                    
                    Image("Book2")
                        .offset(x: 0, y: showAnimation ? 0 : -50)
                        .animation(
                            .interpolatingSpring(stiffness: 100, damping: 5)
                            .repeatForever(autoreverses: false).delay(0.06),
                            value: showAnimation
                        )
                    
                    Image("Book4")
                        .offset(x: 0, y: showAnimation ? 0 : -50)
                        .animation(
                            .interpolatingSpring(stiffness: 100, damping: 5)
                            .repeatForever(autoreverses: false).delay(0.08),
                            value: showAnimation
                        )
                }
                
                Text("Tidy Up")
                    .foregroundStyle(Color.accentColor)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                    .offset(x: 0, y: showAnimation ? 0 : -50)
                    .animation(
                        .interpolatingSpring(stiffness: 100, damping: 5)
                        .repeatForever(autoreverses: false).delay(0.02),
                        value: showAnimation
                    )
            }.onAppear() {
                    self.showAnimation.toggle()
                }

        }
    }
}//MARK: - END OF BODY

//MARK: PREVIEW
#Preview {
    LoadingView()
}
