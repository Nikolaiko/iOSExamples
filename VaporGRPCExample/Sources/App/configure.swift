import Vapor

// configures your application
public func configure(_ app: Application) async throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    let grpcServer = ServerLayer(app)
    app.servers.use(.gRPCServer)

    // register routes
    try routes(app)
}
