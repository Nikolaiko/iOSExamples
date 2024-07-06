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

    private let api: ModernServerApi
    private var manager: ModernWiFiMonitor
    private var disposeBag: Set<AnyCancellable> = []

    init(api: ModernServerApi, manager: ModernWiFiMonitor) {
        self.api = api
        self.manager = manager

        self.manager.statePublisher
            .subscribe(on: DispatchQueue.main)
            .sink { status in
                self.onPathUpdate(status: status)
            }
            .store(in: &disposeBag)
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
        api.dataPublisger()
            .receive(on: DispatchQueue.main)
            .sink { cartoon in
                self.loadedCharacters = cartoon
            }
            .store(in: &disposeBag)
    }

}
