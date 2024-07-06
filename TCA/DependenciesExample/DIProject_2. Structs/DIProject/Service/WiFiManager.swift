//
//  WiFiManager.swift
//  DIProject
//
//  Created by Nikolai Baklanov on 06.06.2024.
//

import Foundation

protocol WiFiManager {
    var callback: ((Bool) -> Void)? { get set }

    func start()
}
