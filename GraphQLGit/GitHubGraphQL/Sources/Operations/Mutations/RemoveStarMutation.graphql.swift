// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class RemoveStarMutation: GraphQLMutation {
  public static let operationName: String = "RemoveStar"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      mutation RemoveStar($repoId: ID!) {
        removeStar(input: {starrableId: $repoId}) {
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
      .field("removeStar", RemoveStar?.self, arguments: ["input": ["starrableId": .variable("repoId")]]),
    ] }

    /// Removes a star from a Starrable.
    public var removeStar: RemoveStar? { __data["removeStar"] }

    /// RemoveStar
    ///
    /// Parent Type: `RemoveStarPayload`
    public struct RemoveStar: GitHubGraphQL.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { GitHubGraphQL.Objects.RemoveStarPayload }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("clientMutationId", String?.self),
      ] }

      /// A unique identifier for the client performing the mutation.
      public var clientMutationId: String? { __data["clientMutationId"] }
    }
  }
}
