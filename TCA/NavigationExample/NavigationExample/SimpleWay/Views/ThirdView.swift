//
//  ThirdView.swift
//  NavigationExample
//
//  Created by Николай Бакланов on 19.04.2024.
//

import SwiftUI
import ComposableArchitecture

struct ThirdView: View {
    let store: StoreOf<ThirdViewReducer>

    var body: some View {
        Text(store.thirdScreenValue)
    }
}
