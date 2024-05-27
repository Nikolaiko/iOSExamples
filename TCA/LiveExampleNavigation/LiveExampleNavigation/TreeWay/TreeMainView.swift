//
//  TreeMainView.swift
//  LiveExampleNavigation
//
//  Created by Nikolai Baklanov on 23.04.2024.
//

import SwiftUI
import ComposableArchitecture

struct TreeMainView: View {
    let store: StoreOf<TreeBasedStore>

    var body: some View {
        Group {
            if store.isLoading {
                ProgressView()
            } else {
                List {
                    ForEach(store.loadedCharacters, id: \.id) { current in
                        Text(current.name)
                    }
                }
            }
        }
        .onAppear {
            store.send(.loadData)
        }
    }
}
