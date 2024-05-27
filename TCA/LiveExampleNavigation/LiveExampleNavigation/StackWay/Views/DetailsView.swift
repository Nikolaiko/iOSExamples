//
//  DetailsView.swift
//  NavigationExample
//
//  Created by Nikolai Baklanov on 23.04.2024.
//

import SwiftUI
import ComposableArchitecture

struct DetailsView: View {
    @Bindable var store: StoreOf<DetailFeature>

    var body: some View {
        Text("DetailsView")
    }
}
