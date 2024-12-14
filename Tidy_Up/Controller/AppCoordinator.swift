//
//  AppCoordinator.swift
//  Tidy_Up
//
//  Created by Gina Saviano on 14/12/24.
//

import SwiftUI

class AppCoordinator: ObservableObject { // this class controls the state of the app, defining which view to display
    @Published var currentView: AppView = .splash
    
    enum AppView {
        case splash
        case main
    }
    
    func switchToMainView() { //this function handles the transition
        withAnimation {
            currentView = .main
        }
    }
}

struct AppCoordinatorView: View {
    @ObservedObject var coordinator: AppCoordinator
    
    var body: some View {
        switch coordinator.currentView {
        case .splash:
            SplashScreenView(coordinator: coordinator)
        
        case .main:
            ContentView()
        }
    }
}
