//
//  ContentView.swift
//  BluetoothLEPeriheral
//
//  Created by Nikolai Baklanov on 12.05.2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var viewModel = BLEPeripheralViewModel()

    var body: some View {
        VStack {
            Text(viewModel.state.displayValue())
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
