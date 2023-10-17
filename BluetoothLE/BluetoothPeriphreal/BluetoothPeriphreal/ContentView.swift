//
//  ContentView.swift
//  BlueToothPeripheral
//
//  Created by Nikolai Baklanov on 20.07.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = PeripheralViewModel()

    var body: some View {
        VStack {
            VStack {
                Text("Advertising State: \(viewModel.advertisingError)")
                Text("Current State: \(viewModel.state)")
                Button {
                    viewModel.startAdvertising()
                } label: {
                    Text("Start Advertising")
                }

                Text("Readable: \(viewModel.readableChar)")
                Text("Writable: \(viewModel.writeableChar)")

                
            }
        }
        .padding()
        .onAppear {
            viewModel.initBluetooth()
        }
    }
}
