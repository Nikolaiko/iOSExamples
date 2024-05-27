//
//  ScopeExampleView.swift
//  LiveExampleNavigation
//
//  Created by Nikolai Baklanov on 23.04.2024.
//

import SwiftUI
import ComposableArchitecture

struct ScopeExampleView: View {
    let store: StoreOf<ScopeExampleStore>

    var body: some View {
        VStack {
            if store.onBoardingCompleted {
                let mainViewStore = store.scope(state: \.mainScreenState, action: \.mainScreenAction)
                MainView(store: mainViewStore)
            } else {
                let onBoarding = store.scope(state: \.onBoardingState, action: \.onBoardingAction)
                OnBoardingView(store: onBoarding)
            }
        }
        .onAppear {
            store.send(.checkOnBoaringComplete)
        }
    }
    
}

