//
//  LockService.swift
//  ThreadSafeWays
//
//  Created by Nikolai Baklanov on 17.06.2023.
//

import Foundation

class LockService: UserService {
    private var users: [Int : UserData] = [ : ]
    private var lock = NSLock()

    func addUser(newUser: UserData) {
        lock.lock()
        users[newUser.id] = newUser
        lock.unlock()
    }

    func printAll() {
        print(users)
    }

    func getMethodName() -> String {
        return "Lock method"
    }
}
