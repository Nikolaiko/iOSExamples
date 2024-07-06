//
//  CartoonCharactersView.swift
//  DIProject
//
//  Created by Nikolai Baklanov on 06.06.2024.
//

import SwiftUI
import Dependencies
import NetworkLibrary

public struct CartoonCharactersView: View {
    @ObservedObject var viewModel: CartoonCharactersViewModel

    public init(viewModel: CartoonCharactersViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        if viewModel.isConnected {
            if viewModel.loadedCharacters.isEmpty {
                Text("No Data")
            } else {
                List {
                    ForEach(viewModel.loadedCharacters) { item in
                        Text(item.name)
                    }
                }
            }
        } else {
            Text("Disconnected")
        }
    }
}

#Preview("Online") {
    CartoonCharactersView(
        viewModel: CartoonCharactersViewModel()
    )
}

#Preview("Offline") {
    CartoonCharactersView(
        viewModel: withDependencies { current in
            current.wiFi = ModernWiFiMonitor.noWiFi
        } operation: {
            CartoonCharactersViewModel()
        }
    )
}
