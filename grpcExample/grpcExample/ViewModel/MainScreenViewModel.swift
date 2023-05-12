//
//  MainScreenViewModel.swift
//  grpcExample
//
//  Created by Nikolai Baklanov on 05.03.2023.
//

import Foundation
import SwiftUI

class MainScreenViewModel: ObservableObject, StreamManagerDelegate {
    @Published var name = "Nikolai"
    @Published var simpleResponse = ""

    @Published var streamNames = "Nikolai,Darya,Rodion,Anna S.,Anna K"
    @Published var streamResponse = ""
    @Published var streamResult = ""

    private let pureGRPC = PureGRPCService()
    private var timer: Timer?
    private var bidirectionalManager: BidirectionalStreamManager?
    private var bidirectionalNames: [String] = []
    private var currentNameIndex: Int = 0

    func sendHello() {
        pureGRPC.sayHello(name: name) { response in
            DispatchQueue.main.async {
                self.simpleResponse = "Simple response : \(response)"
            }
        }
    }

    func sendManyHello() {
        streamResponse = ""

        let names = streamNames.split(separator: ",")
        let streamManager = pureGRPC.sayManyHello()
        streamManager.delegate = self

        for currentName in names {
            streamManager.send(message: String(currentName))
        }
        streamManager.close()
    }

    func onMessageDelivered(result: String) {
        DispatchQueue.main.async {
            self.streamResponse += "\(result)\n"
        }
    }

    func onStreamResponse(result: String) {
        DispatchQueue.main.async {
            self.streamResult = result
        }
    }

    func sendBidirectionalStream() {
        bidirectionalNames = streamNames.split(separator: ",").map({ value in String(value) })
        bidirectionalManager = pureGRPC.bidirectionalStream(callback: bidirectionalResponse)
        currentNameIndex = 0

        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true, block: { currentTimer in
            self.bidirectionalManager?.send(message: self.bidirectionalNames[self.currentNameIndex])
            self.currentNameIndex += 1

            if self.currentNameIndex == self.bidirectionalNames.count {
                currentTimer.invalidate()
                self.bidirectionalManager?.close()
            }
        })
    }

    func bidirectionalResponse(message: String) {
        print("Bidirectional response : \(message)")
        DispatchQueue.main.async {
            self.streamResult = message
        }
    }
}
