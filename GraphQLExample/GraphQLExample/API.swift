// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class ContinentsListQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query ContinentsList {
      continents {
        __typename
        code
        name
      }
    }
    """

  public let operationName: String = "ContinentsList"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("continents", type: .nonNull(.list(.nonNull(.object(Continent.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(continents: [Continent]) {
      self.init(unsafeResultMap: ["__typename": "Query", "continents": continents.map { (value: Continent) -> ResultMap in value.resultMap }])
    }

    public var continents: [Continent] {
      get {
        return (resultMap["continents"] as! [ResultMap]).map { (value: ResultMap) -> Continent in Continent(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Continent) -> ResultMap in value.resultMap }, forKey: "continents")
      }
    }

    public struct Continent: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Continent"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("code", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(code: GraphQLID, name: String) {
        self.init(unsafeResultMap: ["__typename": "Continent", "code": code, "name": name])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var code: GraphQLID {
        get {
          return resultMap["code"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "code")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }
    }
  }
}

public final class CountiresByContinentQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query CountiresByContinent($codeId: ID!) {
      continent(code: $codeId) {
        __typename
        code
        name
        countries {
          __typename
          code
          name
          native
          capital
          currency
          languages {
            __typename
            name
          }
          states {
            __typename
            name
          }
        }
      }
    }
    """

  public let operationName: String = "CountiresByContinent"

  public var codeId: GraphQLID

  public init(codeId: GraphQLID) {
    self.codeId = codeId
  }

  public var variables: GraphQLMap? {
    return ["codeId": codeId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("continent", arguments: ["code": GraphQLVariable("codeId")], type: .object(Continent.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(continent: Continent? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "continent": continent.flatMap { (value: Continent) -> ResultMap in value.resultMap }])
    }

    public var continent: Continent? {
      get {
        return (resultMap["continent"] as? ResultMap).flatMap { Continent(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "continent")
      }
    }

    public struct Continent: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Continent"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("code", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("countries", type: .nonNull(.list(.nonNull(.object(Country.selections))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(code: GraphQLID, name: String, countries: [Country]) {
        self.init(unsafeResultMap: ["__typename": "Continent", "code": code, "name": name, "countries": countries.map { (value: Country) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var code: GraphQLID {
        get {
          return resultMap["code"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "code")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var countries: [Country] {
        get {
          return (resultMap["countries"] as! [ResultMap]).map { (value: ResultMap) -> Country in Country(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Country) -> ResultMap in value.resultMap }, forKey: "countries")
        }
      }

      public struct Country: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Country"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("code", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("native", type: .nonNull(.scalar(String.self))),
            GraphQLField("capital", type: .scalar(String.self)),
            GraphQLField("currency", type: .scalar(String.self)),
            GraphQLField("languages", type: .nonNull(.list(.nonNull(.object(Language.selections))))),
            GraphQLField("states", type: .nonNull(.list(.nonNull(.object(State.selections))))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(code: GraphQLID, name: String, native: String, capital: String? = nil, currency: String? = nil, languages: [Language], states: [State]) {
          self.init(unsafeResultMap: ["__typename": "Country", "code": code, "name": name, "native": native, "capital": capital, "currency": currency, "languages": languages.map { (value: Language) -> ResultMap in value.resultMap }, "states": states.map { (value: State) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var code: GraphQLID {
          get {
            return resultMap["code"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "code")
          }
        }

        public var name: String {
          get {
            return resultMap["name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var native: String {
          get {
            return resultMap["native"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "native")
          }
        }

        public var capital: String? {
          get {
            return resultMap["capital"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "capital")
          }
        }

        public var currency: String? {
          get {
            return resultMap["currency"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "currency")
          }
        }

        public var languages: [Language] {
          get {
            return (resultMap["languages"] as! [ResultMap]).map { (value: ResultMap) -> Language in Language(unsafeResultMap: value) }
          }
          set {
            resultMap.updateValue(newValue.map { (value: Language) -> ResultMap in value.resultMap }, forKey: "languages")
          }
        }

        public var states: [State] {
          get {
            return (resultMap["states"] as! [ResultMap]).map { (value: ResultMap) -> State in State(unsafeResultMap: value) }
          }
          set {
            resultMap.updateValue(newValue.map { (value: State) -> ResultMap in value.resultMap }, forKey: "states")
          }
        }

        public struct Language: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Language"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Language", "name": name])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var name: String? {
            get {
              return resultMap["name"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }
        }

        public struct State: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["State"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String) {
            self.init(unsafeResultMap: ["__typename": "State", "name": name])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }
        }
      }
    }
  }
}
