import SwiftUI

struct CommunicationView: View {
    @ObservedObject private var viewModel = CommunicationViewModel()

    var body: some View {
        VStack {
            Text("Count : \(viewModel.count)")
            Text("Temp : \(viewModel.temp) grad")
            Text(viewModel.status)
        }
    }
}

struct CommunicationView_Previews: PreviewProvider {
    static var previews: some View {
        CommunicationView()
    }
}
