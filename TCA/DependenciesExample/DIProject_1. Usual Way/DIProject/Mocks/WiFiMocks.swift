//
//  WiFiMocks.swift
//  DIProject
//
//  Created by Nikolai Baklanov on 06.06.2024.
//

import Foundation


struct AllGood: WiFiManager {
    var callback: ((Bool) -> Void)?
    
    func start() {
        callback?(true)
    }
    

}

struct NoWiFi: WiFiManager {
    var callback: ((Bool) -> Void)?
    
    func start() {
        callback?(false)
    }
}
