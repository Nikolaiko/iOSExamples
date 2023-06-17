//
//  ExampleView.swift
//  ThreadSafeWays
//
//  Created by Nikolai Baklanov on 17.06.2023.
//

import SwiftUI

struct ExampleView: View {
    @StateObject var viewModel: ExampleViewModel

    var body: some View {
        VStack {
            Text(viewModel.getMethodName())
            Button {
                viewModel.printResult()
            } label: {
                Text("Print Result")
            }
        }
        .onAppear {
            viewModel.startTest()
        }
    }
}
