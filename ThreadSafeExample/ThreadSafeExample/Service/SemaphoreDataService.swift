//
//  SemaphoreDataService.swift
//  ThreadSafeExample
//
//  Created by Nikolai Baklanov on 04.06.2023.
//

import Foundation

class SemaphoreDataService: UserDataService {
    private var users: [Int : User] = [ : ]
    private let semaphore = DispatchSemaphore(value: 1)

    func addNewUser(newUser: User) {
        semaphore.signal()
        users[newUser.id] = newUser
        semaphore.wait()
    }

    func printAll() {
        users.forEach { id, value in
            print("Id : \(id), user : \(value.name)")
        }
    }
}
