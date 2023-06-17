//
//  SemaphoreView.swift
//  ThreadSafeExample
//
//  Created by Nikolai Baklanov on 04.06.2023.
//

import SwiftUI

struct SemaphoreView: View {
    @StateObject private var viewModel = SemaphoreViewModel()

    var body: some View {
        VStack {
            Text("SemaphoreViewModelTest")
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

struct SemaphoreView_Previews: PreviewProvider {
    static var previews: some View {
        SemaphoreView()
    }
}
