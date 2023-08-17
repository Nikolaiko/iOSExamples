//
//  File.swift
//  
//
//  Created by Nikolai Baklanov on 17.08.2023.
//

import Foundation
import Vapor
import GRPC

public class ServerLayer: Vapor.Server {

    public var onShutdown: NIOCore.EventLoopFuture<Void> {
        print("onShoutdown!")
        return server!.channel.closeFuture
    }

    private var port = 50051
    private var host = "127.0.0.1"
    private var application: Application
    private var server: GRPC.Server?


    public init(_ app: Application) {
        self.application = app
    }

    public func start(address: BindAddress?) throws {
        var logger = Logger(label: "grpc", factory: logHelper)
        logger.logLevel = .debug

        let group = application.eventLoopGroup
        let server = GRPC.Server.insecure(group: group)
            .withLogger(logger)
            .withServiceProviders([HelloMainController(application)])
            .bind(host: self.host, port: self.port)

        server.map {
            $0.channel.localAddress
        }.whenSuccess { address in
            print("Server started! : \(address?.hostname), \(address?.port)")
        }

        self.server = try server.wait()
    }

    public func logHelper(label: String) -> LogHandler {
        return StreamLogHandler.standardError(label: label)
    }

    public func shutdown() {
        print("shutdown")
        try! self.server!.close().wait()
    }
}
