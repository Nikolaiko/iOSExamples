//
//  SimpleWaySecond.swift
//  LiveExampleNavigation
//
//  Created by Nikolai Baklanov on 23.04.2024.
//

import SwiftUI
import ComposableArchitecture

struct SimpleWaySecond: View {
    let store: StoreOf<SimpleWaySecondChild>

    var body: some View {
        Text(store.title)
    }
}

