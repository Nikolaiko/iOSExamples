//
//  ModernWiFiMonitor.swift
//  DIProject
//
//  Created by Nikolai Baklanov on 10.06.2024.
//

import Foundation
import Network
import Combine

struct ModernWiFiMonitor {
    var statePublisher: AnyPublisher<Bool, Never>
}
