//
//  ContentView.swift
//  GraphQLGit
//
//  Created by Nikolai Baklanov on 03.05.2023.
//

import SwiftUI
import SwiftDevPackage

struct ContentView: View {
    @EnvironmentObject var navigation: NavigationControllerViewModel
    var body: some View {
        VStack {
            Button {
                navigation.push(ProfileView())
            } label: {
                Text("Profile")
            }

            Button {
                navigation.push(SearchView())
            } label: {
                Text("Search")
            }

        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
