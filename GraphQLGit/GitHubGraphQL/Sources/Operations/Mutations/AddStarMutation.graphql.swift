// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class AddStarMutation: GraphQLMutation {
  public static let operationName: String = "AddStar"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      mutation AddStar($repoId: ID!) {
        addStar(input: {starrableId: $repoId}) {
          __typename
          clientMutationId
        }
      }
      """#
    ))

  public var repoId: ID

  public init(repoId: ID) {
    self.repoId = repoId
  }

  public var __variables: Variables? { ["repoId": repoId] }

  public struct Data: GitHubGraphQL.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { GitHubGraphQL.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("addStar", AddStar?.self, arguments: ["input": ["starrableId": .variable("repoId")]]),
    ] }

    /// Adds a star to a Starrable.
    public var addStar: AddStar? { __data["addStar"] }

    /// AddStar
    ///
    /// Parent Type: `AddStarPayload`
    public struct AddStar: GitHubGraphQL.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { GitHubGraphQL.Objects.AddStarPayload }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("clientMutationId", String?.self),
      ] }

      /// A unique identifier for the client performing the mutation.
      public var clientMutationId: String? { __data["clientMutationId"] }
    }
  }
}
