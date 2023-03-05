//
//  PureGRPCService.swift
//  grpcExample
//
//  Created by Nikolai Baklanov on 02.03.2023.
//

import Foundation
import GRPC

class PureGRPCService {
    private let group = PlatformSupport.makeEventLoopGroup(loopCount: 1)
    private var client: Greeter_GreeterNIOClient
    //private var notesTask: Task<Array<AppNote>?, Error>?

    init() {
        let channel = ClientConnection
            .insecure(group: group)
            .connect(host: "127.0.0.1", port: 50051)
        client = Greeter_GreeterNIOClient(channel: channel)
    }

    func sayHello(name: String, callback: @escaping StringCallback) {
        var request = Greeter_HelloRequest()
        request.name = name

        client.sayHello(request).response.whenComplete { result in
            switch result {
            case .success(let data):
                callback(data.message)
            case .failure(let errorObject):
                callback("Error in hello : \(errorObject.localizedDescription)")
            }
        }
    }

    func sayManyHello() -> ClientStreamManager {
        return ClientStreamManager(stream: client.lotsOfRequests())
    }

    func bidirectionalStream(callback: @escaping StringCallback) -> BidirectionalStreamManager {
        let stream = client.bidirectionalHello { response in
            callback(response.message)
        }
        return BidirectionalStreamManager(stream: stream)
    }

}
