// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class FindRepositoriesQuery: GraphQLQuery {
  public static let operationName: String = "FindRepositories"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      query FindRepositories($query: String!) {
        search(first: 15, type: REPOSITORY, query: $query) {
          __typename
          nodes {
            __typename
            ... on Repository {
              id
              name
              stargazerCount
            }
          }
        }
      }
      """#
    ))

  public var query: String

  public init(query: String) {
    self.query = query
  }

  public var __variables: Variables? { ["query": query] }

  public struct Data: GitHubGraphQL.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { GitHubGraphQL.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("search", Search.self, arguments: [
        "first": 15,
        "type": "REPOSITORY",
        "query": .variable("query")
      ]),
    ] }

    /// Perform a search across resources, returning a maximum of 1,000 results.
    public var search: Search { __data["search"] }

    /// Search
    ///
    /// Parent Type: `SearchResultItemConnection`
    public struct Search: GitHubGraphQL.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { GitHubGraphQL.Objects.SearchResultItemConnection }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("nodes", [Node?]?.self),
      ] }

      /// A list of nodes.
      public var nodes: [Node?]? { __data["nodes"] }

      /// Search.Node
      ///
      /// Parent Type: `SearchResultItem`
      public struct Node: GitHubGraphQL.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { GitHubGraphQL.Unions.SearchResultItem }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .inlineFragment(AsRepository.self),
        ] }

        public var asRepository: AsRepository? { _asInlineFragment() }

        /// Search.Node.AsRepository
        ///
        /// Parent Type: `Repository`
        public struct AsRepository: GitHubGraphQL.InlineFragment {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public typealias RootEntityType = FindRepositoriesQuery.Data.Search.Node
          public static var __parentType: ApolloAPI.ParentType { GitHubGraphQL.Objects.Repository }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("id", GitHubGraphQL.ID.self),
            .field("name", String.self),
            .field("stargazerCount", Int.self),
          ] }

          public var id: GitHubGraphQL.ID { __data["id"] }
          /// The name of the repository.
          public var name: String { __data["name"] }
          /// Returns a count of how many stargazers there are on this object
          ///
          public var stargazerCount: Int { __data["stargazerCount"] }
        }
      }
    }
  }
}
