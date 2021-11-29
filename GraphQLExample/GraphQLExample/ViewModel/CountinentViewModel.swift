import Foundation

class CountinentViewModel: ObservableObject {
    @Published var continents = [MyContinent]()
    
    func loadData() {
        Network.shared.apollo.fetch(query: ContinentsListQuery() ) { result in
          switch result {
          case .success(let graphQLResult):
              self.continents = graphQLResult.data?.continents.map({ continent in
                  MyContinent(id: continent.code, name: continent.name)
              }) ?? []
          case .failure(let error):
            print("Failure! Error: \(error)")
          }
        }
    }
}
