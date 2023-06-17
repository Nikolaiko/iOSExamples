//
//  SemaphoreView.swift
//  ThreadSafeExample
//
//  Created by Nikolai Baklanov on 04.06.2023.
//

import SwiftUI

struct PtPhreadView: View {
    @StateObject private var viewModel = PtPhreadViewModel()

    var body: some View {
        VStack {
            Text("PtPhreadViewModelTest")
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

