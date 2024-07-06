//
//  ModernWiFiMonitor.swift
//  DIProject
//
//  Created by Nikolai Baklanov on 10.06.2024.
//

import Foundation
import Network
import Combine

public struct ModernWiFiMonitor {
    public var statePublisher: AnyPublisher<Bool, Never>
}
