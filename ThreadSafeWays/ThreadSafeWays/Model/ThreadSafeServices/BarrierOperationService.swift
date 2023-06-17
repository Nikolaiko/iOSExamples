//
//  BarrierOperationService.swift
//  ThreadSafeWays
//
//  Created by Nikolai Baklanov on 17.06.2023.
//

import Foundation

class ConcurrentQueueService: UserService {
    private var users: [Int : UserData] = [ : ]
    private var queue = DispatchQueue(label: "MyTest", attributes: .concurrent)

    func addUser(newUser: UserData) {
        queue.async(flags: .barrier) {
            self.users[newUser.id] = newUser
        }
    }

    func printAll() {
        print(users)
    }

    func getMethodName() -> String {
        return "Concurrent Queue method"
    }
}
