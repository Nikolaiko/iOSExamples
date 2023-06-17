//
//  SemaphoreService.swift
//  ThreadSafeWays
//
//  Created by Nikolai Baklanov on 17.06.2023.
//

import Foundation

class SemaphoreService: UserService {
    private var users: [Int : UserData] = [ : ]
    private var semaphore = DispatchSemaphore(value: 1)

    func addUser(newUser: UserData) {
        semaphore.wait()
        users[newUser.id] = newUser
        semaphore.signal()
    }

    func printAll() {
        print(users)
    }

    func getMethodName() -> String {
        return "Semaphore method"
    }
}
