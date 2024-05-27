//
//  SimpleWayFirst.swift
//  LiveExampleNavigation
//
//  Created by Nikolai Baklanov on 23.04.2024.
//

import SwiftUI
import ComposableArchitecture

struct SimpleWayFirst: View {
    let store: StoreOf<SimpleWayFirstChild>
    
    var body: some View {
        Text(store.title)
    }
}
