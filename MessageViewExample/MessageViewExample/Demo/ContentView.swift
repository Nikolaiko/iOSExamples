//
//  ContentView.swift
//  MessageViewExample
//
//  Created by Nikolai Baklanov on 02.09.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = DemoViewModel()

    var body: some View {
        GeometryReader { geom in
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        viewModel.isPresented.toggle()
                    } label: {
                        Text("Toggle")
                    }
                    .offset(x: 0, y: 30)
                    Spacer()
                }
                Spacer()
            }
        }
        .modifier(
            MessageBox(
                isPresented: $viewModel.isPresented,
                backGroundColor: Color.clear,
                messageAnimation: .default,
                messageType: .banner,
                view: { AlretViewExample() }
            )
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
