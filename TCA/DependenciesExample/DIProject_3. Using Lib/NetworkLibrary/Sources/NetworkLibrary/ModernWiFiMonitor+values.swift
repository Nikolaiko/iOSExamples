//
//  ModernWiFiMonitor+live.swift
//  DIProject
//
//  Created by Nikolai Baklanov on 10.06.2024.
//
//
import Foundation
import Combine
import Network
import Dependencies

extension ModernWiFiMonitor: DependencyKey {
    public static var liveValue: Self {
        let manager = NWPathMonitor()
        let subject = PassthroughSubject<NWPath, Never>()

        manager.pathUpdateHandler = subject.send

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

    public static var noWiFi: Self {
        return Self(
            statePublisher: Just(false).eraseToAnyPublisher()
        )
    }

    public static var previewValue: Self {
        return Self(
            statePublisher: Just(true).eraseToAnyPublisher()
        )
    }
}
