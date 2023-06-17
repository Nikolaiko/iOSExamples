//
//  ContentView.swift
//  ThreadSafeWays
//
//  Created by Nikolai Baklanov on 17.06.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(
                    destination: ExampleView(
                        viewModel: ExampleViewModel(service: UsualService())
                    )
                ) {
                    Text("Usual Way")
                }
                NavigationLink(
                    destination: ExampleView(
                        viewModel: ExampleViewModel(service: MutexService())
                    )
                ) {
                    Text("Mutex Way")
                }

                NavigationLink(
                    destination: ExampleView(
                        viewModel: ExampleViewModel(service: LockService())
                    )
                ) {
                    Text("Lock Way")
                }

                NavigationLink(
                    destination: ExampleView(
                        viewModel: ExampleViewModel(service: SpinLockService())
                    )
                ) {
                    Text("Spin Lock Way")
                }

                NavigationLink(
                    destination: ExampleView(
                        viewModel: ExampleViewModel(service: UnfairLockService())
                    )
                ) {
                    Text("Unfair Lock Way")
                }

                NavigationLink(
                    destination: ExampleView(
                        viewModel: ExampleViewModel(service: SemaphoreService())
                    )
                ) {
                    Text("Semaphore Way")
                }

                NavigationLink(
                    destination: ExampleView(
                        viewModel: ExampleViewModel(service: SerialQueueService())
                    )
                ) {
                    Text("Serial Queue Way")
                }

                NavigationLink(
                    destination: ExampleView(
                        viewModel: ExampleViewModel(service: ConcurrentQueueService())
                    )
                ) {
                    Text("Async Queue Way")
                }
            }
        }
    }
}
