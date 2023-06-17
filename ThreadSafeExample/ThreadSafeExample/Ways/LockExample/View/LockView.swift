//
//  LockView.swift
//  ThreadSafeExample
//
//  Created by Nikolai Baklanov on 04.06.2023.
//

import SwiftUI

struct LockView: View {
    @StateObject private var viewModel = LockViewModel()

    var body: some View {
        VStack {
            Text("LockViewModelTest")
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

struct LockView_Previews: PreviewProvider {
    static var previews: some View {
        LockView()
    }
}
