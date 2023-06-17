//
//  ExampleViewModel.swift
//  ThreadSafeWays
//
//  Created by Nikolai Baklanov on 17.06.2023.
//

import Foundation
import SwiftUI

class ExampleViewModel: ObservableObject {
    private let service: UserService

    init(service: UserService) {
        self.service = service
    }

    func startTest() {
        DispatchQueue.concurrentPerform(iterations: 10) { index in    
            self.addUserIndex(index: index)
        }
    }

    func printResult() {
        service.printAll()
    }

    func getMethodName() -> String {
        service.getMethodName()
    }

    private func addUserIndex(index: Int) {
        service.addUser(newUser: UserData(id: index, name: "user: \(index)"))
    }
}
