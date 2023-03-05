//
//  BidirectionalStreamManager.swift
//  grpcExample
//
//  Created by Nikolai Baklanov on 05.03.2023.
//

import Foundation
import GRPC

class BidirectionalStreamManager {
    var delegate: StreamManagerDelegate?

    private let stream: BidirectionalStreamingCall<Greeter_HelloRequest, Greeter_HelloResponse>

    init(
        stream: BidirectionalStreamingCall<Greeter_HelloRequest, Greeter_HelloResponse>
    ) {
        self.stream = stream
    }

    func send(message: String) {
        var data = Greeter_HelloRequest()
        data.name = message

        stream.sendMessage(data).whenComplete { result in
            switch result {
            case .success:
                print("Message \(message) delivered")
                self.delegate?.onMessageDelivered(result: "Message \(message) delivered")
            case .failure(let errorObject):
                print("Message : \(message) failed with error: \(errorObject.localizedDescription)")
                self.delegate?.onMessageDelivered(result: "Message : \(message) failed with error: \(errorObject.localizedDescription)")
            }
        }
    }

    func close() {
        stream.sendEnd().whenComplete { result in
            switch result {
            case .success:
                print("End delivered")
            case .failure(let errorObject):
                print("End failed with error: \(errorObject.localizedDescription)")
            }
        }
    }
}
