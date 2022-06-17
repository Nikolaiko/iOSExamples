import Foundation
import WatchConnectivity

public final class ConnectivityManager: NSObject {
    public static let shared = ConnectivityManager()

    public var delegate: ManagerDelegate? = nil

    private override init() {
        super.init()

        if WCSession.isSupported() {
            WCSession.default.delegate = self
            WCSession.default.activate()
        } else {
            print("Damn!")
        }
    }

    public func send(_ message: String) {
        guard WCSession.default.activationState == .activated else {
            return
        }
#if os(iOS)
        guard WCSession.default.isWatchAppInstalled else {
            return
        }
#else
        guard WCSession.default.isCompanionAppInstalled else {
            return
        }
#endif

        WCSession.default.sendMessage([kMessage : message], replyHandler: nil) { error in
            print("Cannot send message: \(String(describing: error))")
        }
    }
}

extension ConnectivityManager: WCSessionDelegate {
    public func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        if let notificationText = message[kMessage] as? String {
            delegate?.getMessage(message: notificationText)
        }
    }

    public func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {}

#if os(iOS)
    public func sessionDidBecomeInactive(_ session: WCSession) {}
    public func sessionDidDeactivate(_ session: WCSession) {
        session.activate()
    }
#endif
}
