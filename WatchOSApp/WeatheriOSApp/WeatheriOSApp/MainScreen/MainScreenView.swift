import SwiftUI

struct MainScreenView: View {
    @ObservedObject private var viewModel = MainScreenViewModel()

    var body: some View {
        VStack {
            Text("lat : \(viewModel.latValue)")
                .font(.headline)
            Text("lng : \(viewModel.lngValue)")
                .font(.headline)
            Text(viewModel.status)
                .font(.title)
                .foregroundColor(Color.red)
        }

    }
}

struct MainScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView()
    }
}
