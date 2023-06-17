//
//  SerialView.swift
//  ThreadSafeExample
//
//  Created by Nikolai Baklanov on 17.06.2023.
//

import SwiftUI

struct SerialView: View {
    @StateObject private var viewModel = PtPhreadViewModel()

    var body: some View {
        VStack {
            Text("Serial approach test")
            Button {
                viewModel.printAll()
            } label: {
                Text("Print All")
            }
        }

        .onAppear {
            viewModel.startTest()
        }
    }
}
