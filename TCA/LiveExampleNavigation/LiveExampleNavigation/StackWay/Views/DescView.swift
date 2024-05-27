//
//  DescView.swift
//  NavigationExample
//
//  Created by Nikolai Baklanov on 23.04.2024.
//

import SwiftUI
import ComposableArchitecture

struct DescView: View {
    @Bindable var store: StoreOf<DescriptionFeature>

    var body: some View {
        Text("DescView")
    }
}
