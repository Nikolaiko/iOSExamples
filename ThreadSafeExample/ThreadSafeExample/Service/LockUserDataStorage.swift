//
//  LockUserDataStorage.swift
//  ThreadSafeExample
//
//  Created by Nikolai Baklanov on 04.06.2023.
//

import Foundation

class LockUserDataStorage: UserDataService {
    private var users: [Int : User] = [ : ]
    private let lock = NSLock()

    func addNewUser(newUser: User) {
        lock.lock()
        users[newUser.id] = newUser
        lock.unlock()
    }

    func printAll() {
        users.forEach { id, value in
            print("Id : \(id), user : \(value.name)")
        }
    }
}
