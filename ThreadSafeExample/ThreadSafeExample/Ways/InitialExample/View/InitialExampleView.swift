import SwiftUI

struct InitialExampleView: View {
    @StateObject private var viewModel = InitialViewModel()

    var body: some View {
        VStack {
            Text("Testing!")            
        }
        .onAppear {
            viewModel.startTest()
        }
    }
}
