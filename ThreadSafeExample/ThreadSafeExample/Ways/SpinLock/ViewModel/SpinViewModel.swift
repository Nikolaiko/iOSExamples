//
//  SemaphoreViewModel.swift
//  ThreadSafeExample
//
//  Created by Nikolai Baklanov on 04.06.2023.
//

import Foundation
import SwiftUI

class SpinViewModel: ObservableObject {
    private let storage: UserDataService = UnfairDataService()

    func startTest() {
        DispatchQueue.concurrentPerform(iterations: 10) { index in
            self.writeToArray(index: index)
        }

    }

    func printAll() {
        storage.printAll()
    }

    private func writeToArray(index: Int) {
        self.storage.addNewUser(newUser: User(id: index, name: "Some name"))
    }
}
