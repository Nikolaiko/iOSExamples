import Foundation

struct MyCountry: Identifiable {
    let id: String
    let name: String
    let native: String
    let states: [String]
    let languages: [String]
}
