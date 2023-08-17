//
//  File.swift
//  
//
//  Created by Nikolai Baklanov on 17.08.2023.
//

import Foundation
import GRPC
import Vapor

final class HelloMainController: Greeter_GreeterAsyncProvider {
    private let app: Application
    private let names: [String] = ["Nikolai", "Darya", "Vasili"]

    init(_ app: Application) {
      self.app = app
    }

    func sayHello(
        request: Greeter_HelloRequest,
        context: GRPC.GRPCAsyncServerCallContext
    ) async throws -> Greeter_HelloResponse {
        print("Hello!")
        var response = Greeter_HelloResponse()
        response.message = "Hello, \(request.name) from Vapor"
        return response
    }

    func lotsOfReplies(
        request: Greeter_HelloRequest,
        responseStream: GRPC.GRPCAsyncResponseStreamWriter<Greeter_HelloResponse>,
        context: GRPC.GRPCAsyncServerCallContext
    ) async throws {
        for currentName in names {
            var response = Greeter_HelloResponse()
            response.message = "Async from server : \(currentName)"
            try await responseStream.send(response)
        }
    }

    func lotsOfRequests(
        requestStream: GRPC.GRPCAsyncRequestStream<Greeter_HelloRequest>,
        context: GRPC.GRPCAsyncServerCallContext
    ) async throws -> Greeter_HelloResponse {
        var messagesCount = 0
        var names: [String] = []

        for try await currentMessage in requestStream {
            messagesCount += 1
            names.append(currentMessage.name)
        }

        return .with { response in
            response.message = "Count : \(messagesCount). Names: \(names)"
        }
    }

    func bidirectionalHello(
        requestStream: GRPC.GRPCAsyncRequestStream<Greeter_HelloRequest>,
        responseStream: GRPC.GRPCAsyncResponseStreamWriter<Greeter_HelloResponse>,
        context: GRPC.GRPCAsyncServerCallContext
    ) async throws {
        for try await currentMessage in requestStream {
            var response = Greeter_HelloResponse()
            response.message = "Hello from BiDirectional : \(currentMessage.name)"
            try await responseStream.send(response)
        }

    }
}

