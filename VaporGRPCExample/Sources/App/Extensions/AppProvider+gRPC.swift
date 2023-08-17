//
//  File.swift
//  
//
//  Created by Nikolai Baklanov on 17.08.2023.
//

import Foundation
import Vapor

public extension Application.Servers.Provider {
    static var gRPCServer: Self {
        .init {
            $0.servers.use { app in ServerLayer(app)
            }
        }
    }
}
