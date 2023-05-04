// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetStarredRepositoriesQuery: GraphQLQuery {
  public static let operationName: String = "GetStarredRepositories"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      query GetStarredRepositories($loginName: String!, $count: Int!) {
        user(login: $loginName) {
          __typename
          starredRepositories(first: $count) {
            __typename
            totalCount
            pageInfo {
              __typename
              hasNextPage
            }
            nodes {
              __typename
              id
              name
            }
          }
        }
      }
      """#
    ))

  public var loginName: String
  public var count: Int

  public init(
    loginName: String,
    count: Int
  ) {
    self.loginName = loginName
    self.count = count
  }

  public var __variables: Variables? { [
    "loginName": loginName,
    "count": count
  ] }

  public struct Data: GitHubGraphQL.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { GitHubGraphQL.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("user", User?.self, arguments: ["login": .variable("loginName")]),
    ] }

    /// Lookup a user by login.
    public var user: User? { __data["user"] }

    /// User
    ///
    /// Parent Type: `User`
    public struct User: GitHubGraphQL.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { GitHubGraphQL.Objects.User }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("starredRepositories", StarredRepositories.self, arguments: ["first": .variable("count")]),
      ] }

      /// Repositories the user has starred.
      public var starredRepositories: StarredRepositories { __data["starredRepositories"] }

      /// User.StarredRepositories
      ///
      /// Parent Type: `StarredRepositoryConnection`
      public struct StarredRepositories: GitHubGraphQL.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { GitHubGraphQL.Objects.StarredRepositoryConnection }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("totalCount", Int.self),
          .field("pageInfo", PageInfo.self),
          .field("nodes", [Node?]?.self),
        ] }

        /// Identifies the total count of items in the connection.
        public var totalCount: Int { __data["totalCount"] }
        /// Information to aid in pagination.
        public var pageInfo: PageInfo { __data["pageInfo"] }
        /// A list of nodes.
        public var nodes: [Node?]? { __data["nodes"] }

        /// User.StarredRepositories.PageInfo
        ///
        /// Parent Type: `PageInfo`
        public struct PageInfo: GitHubGraphQL.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { GitHubGraphQL.Objects.PageInfo }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("hasNextPage", Bool.self),
          ] }

          /// When paginating forwards, are there more items?
          public var hasNextPage: Bool { __data["hasNextPage"] }
        }

        /// User.StarredRepositories.Node
        ///
        /// Parent Type: `Repository`
        public struct Node: GitHubGraphQL.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { GitHubGraphQL.Objects.Repository }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", GitHubGraphQL.ID.self),
            .field("name", String.self),
          ] }

          public var id: GitHubGraphQL.ID { __data["id"] }
          /// The name of the repository.
          public var name: String { __data["name"] }
        }
      }
    }
  }
}
