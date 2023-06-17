//
//  BarrierView.swift
//  ThreadSafeExample
//
//  Created by Nikolai Baklanov on 17.06.2023.
//

import SwiftUI

struct BarrierView: View {
    @StateObject private var viewModel = BarrierViewModel()

    var body: some View {
        VStack {
            Text("Barrier approach test")
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
