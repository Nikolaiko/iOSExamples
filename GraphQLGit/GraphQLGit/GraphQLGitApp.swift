//
//  GraphQLGitApp.swift
//  GraphQLGit
//
//  Created by Nikolai Baklanov on 03.05.2023.
//

import SwiftUI
import SwiftDevPackage

@main
struct GraphQLGitApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationControllerView(transition: .custom(.slide, .slide)) {
                ContentView()
            }
        }
    }
}
