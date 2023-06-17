//
//  SpinUserService.swift
//  ThreadSafeExample
//
//  Created by Nikolai Baklanov on 05.06.2023.
//

import Foundation

class SpinDataService: UserDataService {
    private var users: [Int : User] = [ : ]
    private var mutex = OS_SPINLOCK_INIT

    func addNewUser(newUser: User) {
        OSSpinLockLock(&mutex)
        users[newUser.id] = newUser
        OSSpinLockUnlock(&mutex)
    }

    func printAll() {
        users.forEach { id, value in
            print("Id : \(id), user : \(value.name)")
        }
    }
}

class UnfairDataService: UserDataService {
    private var users: [Int : User] = [ : ]
    private var mutex = os_unfair_lock()

    func addNewUser(newUser: User) {
        os_unfair_lock_lock(&mutex)
        users[newUser.id] = newUser
        os_unfair_lock_unlock(&mutex)
    }

    func printAll() {
        users.forEach { id, value in
            print("Id : \(id), user : \(value.name)")
        }
    }
}
