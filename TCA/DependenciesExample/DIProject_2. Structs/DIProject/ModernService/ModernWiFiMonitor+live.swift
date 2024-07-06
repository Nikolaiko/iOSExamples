//
//  ModernWiFiMonitor+live.swift
//  DIProject
//
//  Created by Nikolai Baklanov on 10.06.2024.
//

import Foundation
import Combine
import Network

extension ModernWiFiMonitor {
    static var live: Self {
        let manager = NWPathMonitor()
        let subject = PassthroughSubject<NWPath, Never>()

        manager.pathUpdateHandler = subject.send

        print("Started")

        return Self(
            statePublisher: subject
                .map { $0.status == NWPath.Status.satisfied  }
                .handleEvents(
                    receiveSubscription: { _ in manager.start(queue: .main); print("Subbed") },
                    receiveCancel: { manager.cancel() }
                )
                .eraseToAnyPublisher()
        )
    }

    static var noWiFi: Self {
        return Self(
            statePublisher: Just(false).eraseToAnyPublisher()
        )
    }

    static var gotWiFi: Self {
        return Self(
            statePublisher: Just(true).eraseToAnyPublisher()
        )
    }
}
