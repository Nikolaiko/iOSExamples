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
import Dependencies
import NetworkLibrary

public class CartoonCharactersViewModel: ObservableObject {

    @Published public var loadedCharacters: [CartoonCharacter] = []
    @Published public var isConnected = true

    @Dependency(ModernServerApi.self) var api: ModernServerApi
    @Dependency(\.wiFi) var manager: ModernWiFiMonitor

    private var disposeBag: Set<AnyCancellable> = []

    public init() {
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
