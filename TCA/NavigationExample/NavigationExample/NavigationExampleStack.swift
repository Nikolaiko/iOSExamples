//
//  NavigationExampleStack.swift
//  NavigationExample
//
//  Created by Nikolai Baklanov on 23.04.2024.
//

import SwiftUI
import ComposableArchitecture

struct NavigationExampleStack: View {
    @Bindable var store: StoreOf<NavigationStoreRootFeature>

    var body: some View {
        NavigationStack(
            path: $store.scope(state: \.path, action: \.path)
        ) {
            VStack {
                NavigationLink(
                    state: NavigationStoreRootFeature.Path.State.description(DescriptionFeature.State())
                  ) {
                    Text("Detail")
                  }
                
            }
        } destination: { store in
            switch store.case {
            case .addFeature(let f):
                FeatureView(store: f)
            case .description(let d):
                DescView(store: d)
            case .details(let r):
                DetailsView(store: r)
            }
        }
    }
}

