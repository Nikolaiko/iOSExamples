//
//  FirstView.swift
//  NavigationExample
//
//  Created by Николай Бакланов on 19.04.2024.
//

import SwiftUI
import ComposableArchitecture

struct FirstView: View {
    let store: StoreOf<FirstViewReducer>

    var body: some View {
        Text(store.firstScreenValue)
    }
}
