//
//  ContentView.swift
//  AppIntentsStartup
//
//  Created by Nikolai Baklanov on 07.12.2023.
//

import SwiftUI



struct ContentView: View {
    @ObservedObject var viewModel = ViewModel()

    var body: some View {

        TabView(selection: $viewModel.currentTab) {
            RickyEpisodes()
                .tabItem { Text("Episodes") }
                .tag(AppTabs.rickyEpisodes)

            RickyCharacters()
                .tabItem { Text("Characters") }
                .tag(AppTabs.rickyCharacters)

            RickyLocations()
                .tabItem { Text("Locations") }
                .tag(AppTabs.rickyLocations)

        }
    }
}
