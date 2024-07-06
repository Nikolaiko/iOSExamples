//
//  CartoonCharactersViewModel.swift
//  DIProject
//
//  Created by Nikolai Baklanov on 06.06.2024.
//

import Foundation
import SwiftUI
import Network
import Combine

class CartoonCharactersViewModel: ObservableObject {
    
    @Published var loadedCharacters: [CartoonCharacter] = []
    @Published var isConnected = true

    private let api: ServerApi
    private var manager: WiFiManager
    private var disposeBag: Set<AnyCancellable> = []

    init(api: ServerApi, manager: WiFiManager) {
        self.api = api
        self.manager = manager

        self.manager.callback = onPathUpdate
        self.manager.start()
    }

    private func onPathUpdate(status: Bool) {
        isConnected = status
        if isConnected {
            refreshData()
        } else {
            loadedCharacters = []
        }
    }

    private func refreshData() {
        api.getData()
            .receive(on: DispatchQueue.main)
            .sink { cartoon in
                self.loadedCharacters = cartoon
            }
            .store(in: &disposeBag)
    }

}
