import Foundation
import SwiftUI

class InitialViewModel: ObservableObject {
    private let storage: UserDataService = UsualDataService()
    
    func startTest() {
        DispatchQueue.concurrentPerform(iterations: 10) { index in
            self.writeToArray(index: index)
        }
        
    }

    private func writeToArray(index: Int) {
        self.storage.addNewUser(newUser: User(id: index, name: "Some name"))
    }
}
