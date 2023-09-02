//
//  AlretView.swift
//  MessageViewExample
//
//  Created by Nikolai Baklanov on 02.09.2023.
//

import SwiftUI

struct AlretViewExample: View {
    var body: some View {
        HStack {
            Image(systemName: "checkmark.seal")
                .resizable()
                .frame(width: 35, height: 35)
                .foregroundColor(.blue)
                .padding()
            Text("Hello, World!")
            Spacer()
        }
        .background(Color.green)
    }
}

struct AlretView_Previews: PreviewProvider {
    static var previews: some View {
        AlretViewExample()
    }
}
