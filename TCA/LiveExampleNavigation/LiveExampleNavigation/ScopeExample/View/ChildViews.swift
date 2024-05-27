//
//  ChildViews.swift
//  LiveExampleNavigation
//
//  Created by Nikolai Baklanov on 23.04.2024.
//

import SwiftUI
import ComposableArchitecture

struct OnBoardingView: View {
    let store: StoreOf<OnBoardingStore>

    var body: some View {
        VStack {
            Text(store.title)
            Button(action: {
                store.send(.nextPage)
            }, label: {
                Text("Next")
            })
            Button(action: {
                store.send(.prevPage)
            }, label: {
                Text("Prev")
            })
        }

    }
}


struct MainView: View {
    let store: StoreOf<MainScreenStore>

    var body: some View {
        Text(store.title)
    }
}
