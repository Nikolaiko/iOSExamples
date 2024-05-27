//
//  ContentView.swift
//  LiveExampleNavigation
//
//  Created by Nikolai Baklanov on 23.04.2024.
//

import SwiftUI
import ComposableArchitecture

struct ContentView: View {
    var body: some View {
//        SimpleWayParentView(
//            store: Store(initialState: SimpleWayStore.State(),
//                         reducer: { SimpleWayStore() })
//        )
//        ScopeExampleView(
//            store: Store(initialState: ScopeExampleStore.State(),
//                         reducer: { ScopeExampleStore() })
//        )
        TreeMainView(
            store: Store(initialState: TreeBasedStore.State(), reducer: { TreeBasedStore() })
        )
    }
}

