//
//  DependencyValues+KeyPath.swift
//  DIProject
//
//  Created by Nikolai Baklanov on 14.06.2024.
//

import Foundation
import Dependencies

extension DependencyValues {
    public var networkLayer: ModernServerApi {
        get { self[ModernServerApi.self] }
        set { self[ModernServerApi.self] = newValue }
    }

    public var wiFi: ModernWiFiMonitor {
        get { self[ModernWiFiMonitor.self] }
        set { self[ModernWiFiMonitor.self] = newValue }
    }
}
