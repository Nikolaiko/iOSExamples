import Foundation
import Apollo


class GraphQLViewModel: ObservableObject {
    @Published var countries = [MyCountry]()
    
    func loadData(countryId: String) {
        print("ID: \(countryId)")
        Network.shared.apollo.fetch(query: CountiresByContinentQuery(codeId: countryId)) { result in
          switch result {
          case .success(let graphQLResult):
              self.countries = graphQLResult.data?.continent?.countries.map({ country in
                  MyCountry(
                    id: country.code.lowercased(),
                    name: country.name,
                    native: country.native,
                    states: country.states.map({ st in
                        st.name
                    }),
                    languages: country.languages.map({ lng in
                        lng.name ?? "Unknown name"
                    })
                  )
              }) ?? []
          case .failure(let error):
            print("Failure! Error: \(error)")
          }
        }
    }
}
