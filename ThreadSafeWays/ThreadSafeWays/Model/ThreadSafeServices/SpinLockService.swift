//
//  SpinLockService.swift
//  ThreadSafeWays
//
//  Created by Nikolai Baklanov on 17.06.2023.
//

import Foundation

class SpinLockService: UserService {
    private var users: [Int : UserData] = [ : ]
    private var mutex = OS_SPINLOCK_INIT

    func addUser(newUser: UserData) {
        OSSpinLockLock(&mutex)
        users[newUser.id] = newUser
        OSSpinLockUnlock(&mutex)
    }

    func printAll() {
        print(users)
    }

    func getMethodName() -> String {
        return "Spin Lock method"
    }
}
