//
//  ContentView.swift
//  grpcExample
//
//  Created by Nikolai Baklanov on 02.03.2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = MainScreenViewModel()

    var body: some View {
        VStack {
            Text("Simple Request")
            TextField("Eneter message", text: $viewModel.name)
            Text(viewModel.simpleResponse)
            Button {
                viewModel.sendHello()
            } label: {
                Text("Send simple hello")
            }
            Divider()
            Group {
                Text("Client Stream")
                Text("Stream names:\(viewModel.streamNames)")
                Text("Stream responses:\n\(viewModel.streamResponse)")
                Text("Stream result:\n\(viewModel.streamResult)")
                Button {
                    viewModel.sendManyHello()
                } label: {
                    Text("Send client stream")
                }
            }
            Group {
                Divider()
                Button {
                    viewModel.sendBidirectionalStream()
                } label: {
                    Text("Send bidirectional stream")
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
