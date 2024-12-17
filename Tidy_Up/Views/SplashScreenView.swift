//
//  LoadingView.swift
//  Tidy_Up
//
//  Created by Gina Saviano on 07/12/24.
//

import SwiftUI

struct SplashScreenView: View {
    
    @State private var showAnimation: Bool = false
    @State private var scale = 0.6
    @State private var opacity = 0.0
    @ObservedObject var coordinator: AppCoordinator
    
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
            }.accessibilityElement(children: .combine)
                .scaleEffect(0.6)
                .opacity(opacity)
            
                .onAppear() {
                    self.showAnimation.toggle()
                    withAnimation(.easeIn(duration: 1.2)) {
                        self.scale = 1.0
                        self.opacity = 1.0
                    }
                    
                    // Transition to the main screen
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        coordinator.switchToMainView()
                    }
                    
                }
        }
        .accessibilityLabel("Splash Screen. Four books moving up and down with the name of the app.")
    }
}//MARK: - END OF BODY

//MARK: PREVIEW
#Preview {
    SplashScreenView(coordinator: AppCoordinator())
}
