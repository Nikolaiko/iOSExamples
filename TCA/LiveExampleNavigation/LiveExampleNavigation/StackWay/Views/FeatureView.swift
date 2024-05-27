//
//  FeatureView.swift
//  NavigationExample
//
//  Created by Nikolai Baklanov on 23.04.2024.
//

import SwiftUI
import ComposableArchitecture

struct FeatureView: View {
    @Bindable var store: StoreOf<AddItemFeature>

    var body: some View {
        Text("FeatureView")
    }
}
