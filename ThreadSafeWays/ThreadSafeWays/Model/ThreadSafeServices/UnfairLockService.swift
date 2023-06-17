//
//  UnfairLockService.swift
//  ThreadSafeWays
//
//  Created by Nikolai Baklanov on 17.06.2023.
//

import Foundation

class UnfairLockService: UserService {
    private var users: [Int : UserData] = [ : ]
    private var mutex = os_unfair_lock()

    func addUser(newUser: UserData) {
        os_unfair_lock_lock(&mutex)
        users[newUser.id] = newUser
        os_unfair_lock_unlock(&mutex)
    }

    func printAll() {
        print(users)
    }

    func getMethodName() -> String {
        return "Unfair Lock method"
    }
}
