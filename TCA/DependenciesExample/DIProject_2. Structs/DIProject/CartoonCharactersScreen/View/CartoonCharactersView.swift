//
//  CartoonCharactersView.swift
//  DIProject
//
//  Created by Nikolai Baklanov on 06.06.2024.
//

import SwiftUI

struct CartoonCharactersView: View {
    @ObservedObject var viewModel: CartoonCharactersViewModel

    var body: some View {
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

#Preview {
    CartoonCharactersView(
        viewModel: CartoonCharactersViewModel(
            api: ModernServerApi.mockData,
            manager: ModernWiFiMonitor.noWiFi
        )
    )
}
