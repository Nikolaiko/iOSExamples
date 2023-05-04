// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class FinadAppUserQuery: GraphQLQuery {
  public static let operationName: String = "FinadAppUser"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      query FinadAppUser($loginName: String!) {
        user(login: $loginName) {
          __typename
          id
          name
          login
          bio
          avatarUrl
          followers {
            __typename
            totalCount
          }
          following {
            __typename
            totalCount
          }
          repositories {
            __typename
            totalCount
          }
          starredRepositories {
            __typename
            totalCount
          }
        }
      }
      """#
    ))

  public var loginName: String

  public init(loginName: String) {
    self.loginName = loginName
  }

  public var __variables: Variables? { ["loginName": loginName] }

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
        .field("id", GitHubGraphQL.ID.self),
        .field("name", String?.self),
        .field("login", String.self),
        .field("bio", String?.self),
        .field("avatarUrl", GitHubGraphQL.URI.self),
        .field("followers", Followers.self),
        .field("following", Following.self),
        .field("repositories", Repositories.self),
        .field("starredRepositories", StarredRepositories.self),
      ] }

      public var id: GitHubGraphQL.ID { __data["id"] }
      /// The user's public profile name.
      public var name: String? { __data["name"] }
      /// The username used to login.
      public var login: String { __data["login"] }
      /// The user's public profile bio.
      public var bio: String? { __data["bio"] }
      /// A URL pointing to the user's public avatar.
      public var avatarUrl: GitHubGraphQL.URI { __data["avatarUrl"] }
      /// A list of users the given user is followed by.
      public var followers: Followers { __data["followers"] }
      /// A list of users the given user is following.
      public var following: Following { __data["following"] }
      /// A list of repositories that the user owns.
      public var repositories: Repositories { __data["repositories"] }
      /// Repositories the user has starred.
      public var starredRepositories: StarredRepositories { __data["starredRepositories"] }

      /// User.Followers
      ///
      /// Parent Type: `FollowerConnection`
      public struct Followers: GitHubGraphQL.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { GitHubGraphQL.Objects.FollowerConnection }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("totalCount", Int.self),
        ] }

        /// Identifies the total count of items in the connection.
        public var totalCount: Int { __data["totalCount"] }
      }

      /// User.Following
      ///
      /// Parent Type: `FollowingConnection`
      public struct Following: GitHubGraphQL.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { GitHubGraphQL.Objects.FollowingConnection }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("totalCount", Int.self),
        ] }

        /// Identifies the total count of items in the connection.
        public var totalCount: Int { __data["totalCount"] }
      }

      /// User.Repositories
      ///
      /// Parent Type: `RepositoryConnection`
      public struct Repositories: GitHubGraphQL.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { GitHubGraphQL.Objects.RepositoryConnection }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("totalCount", Int.self),
        ] }

        /// Identifies the total count of items in the connection.
        public var totalCount: Int { __data["totalCount"] }
      }

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
        ] }

        /// Identifies the total count of items in the connection.
        public var totalCount: Int { __data["totalCount"] }
      }
    }
  }
}
