import Foundation
import SharedConnectivity


class CommunicationViewModel: ObservableObject, ManagerDelegate {
    @Published var count = 0
    @Published var temp: Double = 0.0
    @Published var status = "Waiting for message"

    func getMessage(message: String) {
        DispatchQueue.main.async {
            self.count += 1
            self.status = message

        }



    }



    init() {
        ConnectivityManager.shared.delegate = self
        print("Hello")
    }
}
