//
//  StreamManagerDelegate.swift
//  grpcExample
//
//  Created by Nikolai Baklanov on 05.03.2023.
//

import Foundation

protocol StreamManagerDelegate {
    func onMessageDelivered(result: String)
    func onStreamResponse(result: String)
}
