//
//  Tidy_UpApp.swift
//  Tidy_Up
//
//  Created by Gina Saviano on 07/12/24.
//
// Stable version 1 on 18/12/2024

import SwiftUI

@main
struct Tidy_UpApp: App {
    @StateObject private var coordinator = AppCoordinator()
    
    var body: some Scene {
        WindowGroup {
            AppCoordinatorView(coordinator: coordinator)
        }
    }
}
