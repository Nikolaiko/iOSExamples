import SwiftUI
import iOSDevPackage

struct CountinentView: View {
    @ObservedObject private var viewModel = CountinentViewModel()
    @EnvironmentObject private var nav: NavigationControllerViewModel
    
    var body: some View {
        ScrollView {
            ForEach(viewModel.continents) { continent in
                Text(continent.name)
                    .padding()
                    .onTapGesture {
                        nav.push(CountryView(id: continent.id))
                    }
            }
        }
        .onAppear {
            viewModel.loadData()
        }
    }
}
