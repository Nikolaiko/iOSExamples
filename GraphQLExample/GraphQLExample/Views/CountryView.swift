import SwiftUI
import iOSDevPackage

struct CountryView: View {
    @EnvironmentObject private var nav: NavigationControllerViewModel
    @ObservedObject private var viewModel = GraphQLViewModel()
    
    let id: String
    
    var body: some View {
        VStack {
            Button {
                nav.pop()
            } label: {
                Text("Back!")
            }
            ScrollView {
                ForEach(viewModel.countries) { country in
                    VStack {
                        Text("----------------------------------------------")
                        Text("Name : \(country.name)")
                            .padding()
                        Text("Languages: \(country.languages.joined(separator: ","))")
                        Text("States : \(country.states.joined(separator: ","))")
                        Text("----------------------------------------------")                        
                    }
                }
            }
        }
        .onAppear {
            viewModel.loadData(countryId: id)
        }
    }
}

