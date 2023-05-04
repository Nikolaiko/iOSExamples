// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public typealias ID = String

public protocol SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == GitHubGraphQL.SchemaMetadata {}

public protocol InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == GitHubGraphQL.SchemaMetadata {}

public protocol MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == GitHubGraphQL.SchemaMetadata {}

public protocol MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == GitHubGraphQL.SchemaMetadata {}

public enum SchemaMetadata: ApolloAPI.SchemaMetadata {
  public static let configuration: ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

  public static func objectType(forTypename typename: String) -> Object? {
    switch typename {
    case "Query": return GitHubGraphQL.Objects.Query
    case "User": return GitHubGraphQL.Objects.User
    case "AddedToMergeQueueEvent": return GitHubGraphQL.Objects.AddedToMergeQueueEvent
    case "AddedToProjectEvent": return GitHubGraphQL.Objects.AddedToProjectEvent
    case "App": return GitHubGraphQL.Objects.App
    case "AssignedEvent": return GitHubGraphQL.Objects.AssignedEvent
    case "AutoMergeDisabledEvent": return GitHubGraphQL.Objects.AutoMergeDisabledEvent
    case "AutoMergeEnabledEvent": return GitHubGraphQL.Objects.AutoMergeEnabledEvent
    case "AutoRebaseEnabledEvent": return GitHubGraphQL.Objects.AutoRebaseEnabledEvent
    case "AutoSquashEnabledEvent": return GitHubGraphQL.Objects.AutoSquashEnabledEvent
    case "AutomaticBaseChangeFailedEvent": return GitHubGraphQL.Objects.AutomaticBaseChangeFailedEvent
    case "AutomaticBaseChangeSucceededEvent": return GitHubGraphQL.Objects.AutomaticBaseChangeSucceededEvent
    case "BaseRefChangedEvent": return GitHubGraphQL.Objects.BaseRefChangedEvent
    case "BaseRefDeletedEvent": return GitHubGraphQL.Objects.BaseRefDeletedEvent
    case "BaseRefForcePushedEvent": return GitHubGraphQL.Objects.BaseRefForcePushedEvent
    case "Blob": return GitHubGraphQL.Objects.Blob
    case "Commit": return GitHubGraphQL.Objects.Commit
    case "Discussion": return GitHubGraphQL.Objects.Discussion
    case "Issue": return GitHubGraphQL.Objects.Issue
    case "PullRequest": return GitHubGraphQL.Objects.PullRequest
    case "CommitComment": return GitHubGraphQL.Objects.CommitComment
    case "DiscussionComment": return GitHubGraphQL.Objects.DiscussionComment
    case "GistComment": return GitHubGraphQL.Objects.GistComment
    case "IssueComment": return GitHubGraphQL.Objects.IssueComment
    case "PullRequestReview": return GitHubGraphQL.Objects.PullRequestReview
    case "PullRequestReviewComment": return GitHubGraphQL.Objects.PullRequestReviewComment
    case "CommitCommentThread": return GitHubGraphQL.Objects.CommitCommentThread
    case "DependabotUpdate": return GitHubGraphQL.Objects.DependabotUpdate
    case "DiscussionCategory": return GitHubGraphQL.Objects.DiscussionCategory
    case "PinnedDiscussion": return GitHubGraphQL.Objects.PinnedDiscussion
    case "PullRequestCommitCommentThread": return GitHubGraphQL.Objects.PullRequestCommitCommentThread
    case "RepositoryVulnerabilityAlert": return GitHubGraphQL.Objects.RepositoryVulnerabilityAlert
    case "Release": return GitHubGraphQL.Objects.Release
    case "Bot": return GitHubGraphQL.Objects.Bot
    case "EnterpriseUserAccount": return GitHubGraphQL.Objects.EnterpriseUserAccount
    case "Mannequin": return GitHubGraphQL.Objects.Mannequin
    case "Organization": return GitHubGraphQL.Objects.Organization
    case "Repository": return GitHubGraphQL.Objects.Repository
    case "Gist": return GitHubGraphQL.Objects.Gist
    case "Topic": return GitHubGraphQL.Objects.Topic
    case "Team": return GitHubGraphQL.Objects.Team
    case "Enterprise": return GitHubGraphQL.Objects.Enterprise
    case "CheckRun": return GitHubGraphQL.Objects.CheckRun
    case "StatusContext": return GitHubGraphQL.Objects.StatusContext
    case "ClosedEvent": return GitHubGraphQL.Objects.ClosedEvent
    case "ConvertToDraftEvent": return GitHubGraphQL.Objects.ConvertToDraftEvent
    case "CrossReferencedEvent": return GitHubGraphQL.Objects.CrossReferencedEvent
    case "MergedEvent": return GitHubGraphQL.Objects.MergedEvent
    case "Milestone": return GitHubGraphQL.Objects.Milestone
    case "PullRequestCommit": return GitHubGraphQL.Objects.PullRequestCommit
    case "ReadyForReviewEvent": return GitHubGraphQL.Objects.ReadyForReviewEvent
    case "RepositoryTopic": return GitHubGraphQL.Objects.RepositoryTopic
    case "ReviewDismissedEvent": return GitHubGraphQL.Objects.ReviewDismissedEvent
    case "TeamDiscussion": return GitHubGraphQL.Objects.TeamDiscussion
    case "TeamDiscussionComment": return GitHubGraphQL.Objects.TeamDiscussionComment
    case "Workflow": return GitHubGraphQL.Objects.Workflow
    case "WorkflowRun": return GitHubGraphQL.Objects.WorkflowRun
    case "Project": return GitHubGraphQL.Objects.Project
    case "ProjectV2": return GitHubGraphQL.Objects.ProjectV2
    case "Tag": return GitHubGraphQL.Objects.Tag
    case "Tree": return GitHubGraphQL.Objects.Tree
    case "BranchProtectionRule": return GitHubGraphQL.Objects.BranchProtectionRule
    case "BypassForcePushAllowance": return GitHubGraphQL.Objects.BypassForcePushAllowance
    case "BypassPullRequestAllowance": return GitHubGraphQL.Objects.BypassPullRequestAllowance
    case "CWE": return GitHubGraphQL.Objects.CWE
    case "CheckSuite": return GitHubGraphQL.Objects.CheckSuite
    case "CodeOfConduct": return GitHubGraphQL.Objects.CodeOfConduct
    case "CommentDeletedEvent": return GitHubGraphQL.Objects.CommentDeletedEvent
    case "Comparison": return GitHubGraphQL.Objects.Comparison
    case "ConnectedEvent": return GitHubGraphQL.Objects.ConnectedEvent
    case "ConvertedNoteToIssueEvent": return GitHubGraphQL.Objects.ConvertedNoteToIssueEvent
    case "ConvertedToDiscussionEvent": return GitHubGraphQL.Objects.ConvertedToDiscussionEvent
    case "DemilestonedEvent": return GitHubGraphQL.Objects.DemilestonedEvent
    case "DeployKey": return GitHubGraphQL.Objects.DeployKey
    case "DeployedEvent": return GitHubGraphQL.Objects.DeployedEvent
    case "Deployment": return GitHubGraphQL.Objects.Deployment
    case "DeploymentEnvironmentChangedEvent": return GitHubGraphQL.Objects.DeploymentEnvironmentChangedEvent
    case "DeploymentReview": return GitHubGraphQL.Objects.DeploymentReview
    case "DeploymentStatus": return GitHubGraphQL.Objects.DeploymentStatus
    case "DisconnectedEvent": return GitHubGraphQL.Objects.DisconnectedEvent
    case "DiscussionPoll": return GitHubGraphQL.Objects.DiscussionPoll
    case "DiscussionPollOption": return GitHubGraphQL.Objects.DiscussionPollOption
    case "DraftIssue": return GitHubGraphQL.Objects.DraftIssue
    case "EnterpriseAdministratorInvitation": return GitHubGraphQL.Objects.EnterpriseAdministratorInvitation
    case "EnterpriseIdentityProvider": return GitHubGraphQL.Objects.EnterpriseIdentityProvider
    case "EnterpriseRepositoryInfo": return GitHubGraphQL.Objects.EnterpriseRepositoryInfo
    case "EnterpriseServerInstallation": return GitHubGraphQL.Objects.EnterpriseServerInstallation
    case "EnterpriseServerUserAccount": return GitHubGraphQL.Objects.EnterpriseServerUserAccount
    case "EnterpriseServerUserAccountEmail": return GitHubGraphQL.Objects.EnterpriseServerUserAccountEmail
    case "EnterpriseServerUserAccountsUpload": return GitHubGraphQL.Objects.EnterpriseServerUserAccountsUpload
    case "Environment": return GitHubGraphQL.Objects.Environment
    case "ExternalIdentity": return GitHubGraphQL.Objects.ExternalIdentity
    case "HeadRefDeletedEvent": return GitHubGraphQL.Objects.HeadRefDeletedEvent
    case "HeadRefForcePushedEvent": return GitHubGraphQL.Objects.HeadRefForcePushedEvent
    case "HeadRefRestoredEvent": return GitHubGraphQL.Objects.HeadRefRestoredEvent
    case "IpAllowListEntry": return GitHubGraphQL.Objects.IpAllowListEntry
    case "Label": return GitHubGraphQL.Objects.Label
    case "LabeledEvent": return GitHubGraphQL.Objects.LabeledEvent
    case "Language": return GitHubGraphQL.Objects.Language
    case "License": return GitHubGraphQL.Objects.License
    case "LinkedBranch": return GitHubGraphQL.Objects.LinkedBranch
    case "LockedEvent": return GitHubGraphQL.Objects.LockedEvent
    case "MarkedAsDuplicateEvent": return GitHubGraphQL.Objects.MarkedAsDuplicateEvent
    case "MarketplaceCategory": return GitHubGraphQL.Objects.MarketplaceCategory
    case "MarketplaceListing": return GitHubGraphQL.Objects.MarketplaceListing
    case "MembersCanDeleteReposClearAuditEntry": return GitHubGraphQL.Objects.MembersCanDeleteReposClearAuditEntry
    case "MembersCanDeleteReposDisableAuditEntry": return GitHubGraphQL.Objects.MembersCanDeleteReposDisableAuditEntry
    case "MembersCanDeleteReposEnableAuditEntry": return GitHubGraphQL.Objects.MembersCanDeleteReposEnableAuditEntry
    case "OauthApplicationCreateAuditEntry": return GitHubGraphQL.Objects.OauthApplicationCreateAuditEntry
    case "OrgOauthAppAccessApprovedAuditEntry": return GitHubGraphQL.Objects.OrgOauthAppAccessApprovedAuditEntry
    case "OrgOauthAppAccessDeniedAuditEntry": return GitHubGraphQL.Objects.OrgOauthAppAccessDeniedAuditEntry
    case "OrgOauthAppAccessRequestedAuditEntry": return GitHubGraphQL.Objects.OrgOauthAppAccessRequestedAuditEntry
    case "OrgAddBillingManagerAuditEntry": return GitHubGraphQL.Objects.OrgAddBillingManagerAuditEntry
    case "OrgAddMemberAuditEntry": return GitHubGraphQL.Objects.OrgAddMemberAuditEntry
    case "OrgBlockUserAuditEntry": return GitHubGraphQL.Objects.OrgBlockUserAuditEntry
    case "OrgConfigDisableCollaboratorsOnlyAuditEntry": return GitHubGraphQL.Objects.OrgConfigDisableCollaboratorsOnlyAuditEntry
    case "OrgConfigEnableCollaboratorsOnlyAuditEntry": return GitHubGraphQL.Objects.OrgConfigEnableCollaboratorsOnlyAuditEntry
    case "OrgCreateAuditEntry": return GitHubGraphQL.Objects.OrgCreateAuditEntry
    case "OrgDisableOauthAppRestrictionsAuditEntry": return GitHubGraphQL.Objects.OrgDisableOauthAppRestrictionsAuditEntry
    case "OrgDisableSamlAuditEntry": return GitHubGraphQL.Objects.OrgDisableSamlAuditEntry
    case "OrgDisableTwoFactorRequirementAuditEntry": return GitHubGraphQL.Objects.OrgDisableTwoFactorRequirementAuditEntry
    case "OrgEnableOauthAppRestrictionsAuditEntry": return GitHubGraphQL.Objects.OrgEnableOauthAppRestrictionsAuditEntry
    case "OrgEnableSamlAuditEntry": return GitHubGraphQL.Objects.OrgEnableSamlAuditEntry
    case "OrgEnableTwoFactorRequirementAuditEntry": return GitHubGraphQL.Objects.OrgEnableTwoFactorRequirementAuditEntry
    case "OrgInviteMemberAuditEntry": return GitHubGraphQL.Objects.OrgInviteMemberAuditEntry
    case "OrgInviteToBusinessAuditEntry": return GitHubGraphQL.Objects.OrgInviteToBusinessAuditEntry
    case "OrgRemoveBillingManagerAuditEntry": return GitHubGraphQL.Objects.OrgRemoveBillingManagerAuditEntry
    case "OrgRemoveMemberAuditEntry": return GitHubGraphQL.Objects.OrgRemoveMemberAuditEntry
    case "OrgRemoveOutsideCollaboratorAuditEntry": return GitHubGraphQL.Objects.OrgRemoveOutsideCollaboratorAuditEntry
    case "OrgRestoreMemberAuditEntry": return GitHubGraphQL.Objects.OrgRestoreMemberAuditEntry
    case "OrgRestoreMemberMembershipOrganizationAuditEntryData": return GitHubGraphQL.Objects.OrgRestoreMemberMembershipOrganizationAuditEntryData
    case "OrgUnblockUserAuditEntry": return GitHubGraphQL.Objects.OrgUnblockUserAuditEntry
    case "OrgUpdateDefaultRepositoryPermissionAuditEntry": return GitHubGraphQL.Objects.OrgUpdateDefaultRepositoryPermissionAuditEntry
    case "OrgUpdateMemberAuditEntry": return GitHubGraphQL.Objects.OrgUpdateMemberAuditEntry
    case "OrgUpdateMemberRepositoryCreationPermissionAuditEntry": return GitHubGraphQL.Objects.OrgUpdateMemberRepositoryCreationPermissionAuditEntry
    case "OrgUpdateMemberRepositoryInvitationPermissionAuditEntry": return GitHubGraphQL.Objects.OrgUpdateMemberRepositoryInvitationPermissionAuditEntry
    case "PrivateRepositoryForkingDisableAuditEntry": return GitHubGraphQL.Objects.PrivateRepositoryForkingDisableAuditEntry
    case "OrgRestoreMemberMembershipRepositoryAuditEntryData": return GitHubGraphQL.Objects.OrgRestoreMemberMembershipRepositoryAuditEntryData
    case "PrivateRepositoryForkingEnableAuditEntry": return GitHubGraphQL.Objects.PrivateRepositoryForkingEnableAuditEntry
    case "RepoAccessAuditEntry": return GitHubGraphQL.Objects.RepoAccessAuditEntry
    case "RepoAddMemberAuditEntry": return GitHubGraphQL.Objects.RepoAddMemberAuditEntry
    case "RepoAddTopicAuditEntry": return GitHubGraphQL.Objects.RepoAddTopicAuditEntry
    case "RepoRemoveTopicAuditEntry": return GitHubGraphQL.Objects.RepoRemoveTopicAuditEntry
    case "RepoArchivedAuditEntry": return GitHubGraphQL.Objects.RepoArchivedAuditEntry
    case "RepoChangeMergeSettingAuditEntry": return GitHubGraphQL.Objects.RepoChangeMergeSettingAuditEntry
    case "RepoConfigDisableAnonymousGitAccessAuditEntry": return GitHubGraphQL.Objects.RepoConfigDisableAnonymousGitAccessAuditEntry
    case "RepoConfigDisableCollaboratorsOnlyAuditEntry": return GitHubGraphQL.Objects.RepoConfigDisableCollaboratorsOnlyAuditEntry
    case "RepoConfigDisableContributorsOnlyAuditEntry": return GitHubGraphQL.Objects.RepoConfigDisableContributorsOnlyAuditEntry
    case "RepoConfigDisableSockpuppetDisallowedAuditEntry": return GitHubGraphQL.Objects.RepoConfigDisableSockpuppetDisallowedAuditEntry
    case "RepoConfigEnableAnonymousGitAccessAuditEntry": return GitHubGraphQL.Objects.RepoConfigEnableAnonymousGitAccessAuditEntry
    case "RepoConfigEnableCollaboratorsOnlyAuditEntry": return GitHubGraphQL.Objects.RepoConfigEnableCollaboratorsOnlyAuditEntry
    case "RepoConfigEnableContributorsOnlyAuditEntry": return GitHubGraphQL.Objects.RepoConfigEnableContributorsOnlyAuditEntry
    case "RepoConfigEnableSockpuppetDisallowedAuditEntry": return GitHubGraphQL.Objects.RepoConfigEnableSockpuppetDisallowedAuditEntry
    case "RepoConfigLockAnonymousGitAccessAuditEntry": return GitHubGraphQL.Objects.RepoConfigLockAnonymousGitAccessAuditEntry
    case "RepoConfigUnlockAnonymousGitAccessAuditEntry": return GitHubGraphQL.Objects.RepoConfigUnlockAnonymousGitAccessAuditEntry
    case "RepoCreateAuditEntry": return GitHubGraphQL.Objects.RepoCreateAuditEntry
    case "RepoDestroyAuditEntry": return GitHubGraphQL.Objects.RepoDestroyAuditEntry
    case "RepoRemoveMemberAuditEntry": return GitHubGraphQL.Objects.RepoRemoveMemberAuditEntry
    case "TeamAddRepositoryAuditEntry": return GitHubGraphQL.Objects.TeamAddRepositoryAuditEntry
    case "OrgRestoreMemberMembershipTeamAuditEntryData": return GitHubGraphQL.Objects.OrgRestoreMemberMembershipTeamAuditEntryData
    case "TeamAddMemberAuditEntry": return GitHubGraphQL.Objects.TeamAddMemberAuditEntry
    case "TeamChangeParentTeamAuditEntry": return GitHubGraphQL.Objects.TeamChangeParentTeamAuditEntry
    case "TeamRemoveMemberAuditEntry": return GitHubGraphQL.Objects.TeamRemoveMemberAuditEntry
    case "TeamRemoveRepositoryAuditEntry": return GitHubGraphQL.Objects.TeamRemoveRepositoryAuditEntry
    case "RepositoryVisibilityChangeDisableAuditEntry": return GitHubGraphQL.Objects.RepositoryVisibilityChangeDisableAuditEntry
    case "RepositoryVisibilityChangeEnableAuditEntry": return GitHubGraphQL.Objects.RepositoryVisibilityChangeEnableAuditEntry
    case "MentionedEvent": return GitHubGraphQL.Objects.MentionedEvent
    case "MergeQueue": return GitHubGraphQL.Objects.MergeQueue
    case "MergeQueueEntry": return GitHubGraphQL.Objects.MergeQueueEntry
    case "MigrationSource": return GitHubGraphQL.Objects.MigrationSource
    case "MilestonedEvent": return GitHubGraphQL.Objects.MilestonedEvent
    case "MovedColumnsInProjectEvent": return GitHubGraphQL.Objects.MovedColumnsInProjectEvent
    case "OIDCProvider": return GitHubGraphQL.Objects.OIDCProvider
    case "OrganizationIdentityProvider": return GitHubGraphQL.Objects.OrganizationIdentityProvider
    case "OrganizationInvitation": return GitHubGraphQL.Objects.OrganizationInvitation
    case "OrganizationMigration": return GitHubGraphQL.Objects.OrganizationMigration
    case "Package": return GitHubGraphQL.Objects.Package
    case "PackageFile": return GitHubGraphQL.Objects.PackageFile
    case "PackageTag": return GitHubGraphQL.Objects.PackageTag
    case "PackageVersion": return GitHubGraphQL.Objects.PackageVersion
    case "PinnedEvent": return GitHubGraphQL.Objects.PinnedEvent
    case "PinnedIssue": return GitHubGraphQL.Objects.PinnedIssue
    case "ProjectCard": return GitHubGraphQL.Objects.ProjectCard
    case "ProjectColumn": return GitHubGraphQL.Objects.ProjectColumn
    case "ProjectV2Field": return GitHubGraphQL.Objects.ProjectV2Field
    case "ProjectV2IterationField": return GitHubGraphQL.Objects.ProjectV2IterationField
    case "ProjectV2SingleSelectField": return GitHubGraphQL.Objects.ProjectV2SingleSelectField
    case "ProjectV2Item": return GitHubGraphQL.Objects.ProjectV2Item
    case "ProjectV2ItemFieldDateValue": return GitHubGraphQL.Objects.ProjectV2ItemFieldDateValue
    case "ProjectV2ItemFieldIterationValue": return GitHubGraphQL.Objects.ProjectV2ItemFieldIterationValue
    case "ProjectV2ItemFieldNumberValue": return GitHubGraphQL.Objects.ProjectV2ItemFieldNumberValue
    case "ProjectV2ItemFieldSingleSelectValue": return GitHubGraphQL.Objects.ProjectV2ItemFieldSingleSelectValue
    case "ProjectV2ItemFieldTextValue": return GitHubGraphQL.Objects.ProjectV2ItemFieldTextValue
    case "ProjectV2View": return GitHubGraphQL.Objects.ProjectV2View
    case "ProjectV2Workflow": return GitHubGraphQL.Objects.ProjectV2Workflow
    case "PublicKey": return GitHubGraphQL.Objects.PublicKey
    case "PullRequestReviewThread": return GitHubGraphQL.Objects.PullRequestReviewThread
    case "PullRequestThread": return GitHubGraphQL.Objects.PullRequestThread
    case "Push": return GitHubGraphQL.Objects.Push
    case "PushAllowance": return GitHubGraphQL.Objects.PushAllowance
    case "Reaction": return GitHubGraphQL.Objects.Reaction
    case "Ref": return GitHubGraphQL.Objects.Ref
    case "ReferencedEvent": return GitHubGraphQL.Objects.ReferencedEvent
    case "ReleaseAsset": return GitHubGraphQL.Objects.ReleaseAsset
    case "RemovedFromMergeQueueEvent": return GitHubGraphQL.Objects.RemovedFromMergeQueueEvent
    case "RemovedFromProjectEvent": return GitHubGraphQL.Objects.RemovedFromProjectEvent
    case "RenamedTitleEvent": return GitHubGraphQL.Objects.RenamedTitleEvent
    case "ReopenedEvent": return GitHubGraphQL.Objects.ReopenedEvent
    case "RepositoryInvitation": return GitHubGraphQL.Objects.RepositoryInvitation
    case "RepositoryMigration": return GitHubGraphQL.Objects.RepositoryMigration
    case "RepositoryRule": return GitHubGraphQL.Objects.RepositoryRule
    case "RepositoryRuleset": return GitHubGraphQL.Objects.RepositoryRuleset
    case "RepositoryRulesetBypassActor": return GitHubGraphQL.Objects.RepositoryRulesetBypassActor
    case "ReviewDismissalAllowance": return GitHubGraphQL.Objects.ReviewDismissalAllowance
    case "ReviewRequest": return GitHubGraphQL.Objects.ReviewRequest
    case "ReviewRequestRemovedEvent": return GitHubGraphQL.Objects.ReviewRequestRemovedEvent
    case "ReviewRequestedEvent": return GitHubGraphQL.Objects.ReviewRequestedEvent
    case "SavedReply": return GitHubGraphQL.Objects.SavedReply
    case "SecurityAdvisory": return GitHubGraphQL.Objects.SecurityAdvisory
    case "SponsorsActivity": return GitHubGraphQL.Objects.SponsorsActivity
    case "SponsorsListing": return GitHubGraphQL.Objects.SponsorsListing
    case "SponsorsListingFeaturedItem": return GitHubGraphQL.Objects.SponsorsListingFeaturedItem
    case "SponsorsTier": return GitHubGraphQL.Objects.SponsorsTier
    case "Sponsorship": return GitHubGraphQL.Objects.Sponsorship
    case "SponsorshipNewsletter": return GitHubGraphQL.Objects.SponsorshipNewsletter
    case "Status": return GitHubGraphQL.Objects.Status
    case "StatusCheckRollup": return GitHubGraphQL.Objects.StatusCheckRollup
    case "SubscribedEvent": return GitHubGraphQL.Objects.SubscribedEvent
    case "TransferredEvent": return GitHubGraphQL.Objects.TransferredEvent
    case "UnassignedEvent": return GitHubGraphQL.Objects.UnassignedEvent
    case "UnlabeledEvent": return GitHubGraphQL.Objects.UnlabeledEvent
    case "UnlockedEvent": return GitHubGraphQL.Objects.UnlockedEvent
    case "UnmarkedAsDuplicateEvent": return GitHubGraphQL.Objects.UnmarkedAsDuplicateEvent
    case "UnpinnedEvent": return GitHubGraphQL.Objects.UnpinnedEvent
    case "UnsubscribedEvent": return GitHubGraphQL.Objects.UnsubscribedEvent
    case "UserBlockedEvent": return GitHubGraphQL.Objects.UserBlockedEvent
    case "UserContentEdit": return GitHubGraphQL.Objects.UserContentEdit
    case "UserStatus": return GitHubGraphQL.Objects.UserStatus
    case "VerifiableDomain": return GitHubGraphQL.Objects.VerifiableDomain
    case "FollowerConnection": return GitHubGraphQL.Objects.FollowerConnection
    case "FollowingConnection": return GitHubGraphQL.Objects.FollowingConnection
    case "RepositoryConnection": return GitHubGraphQL.Objects.RepositoryConnection
    case "StarredRepositoryConnection": return GitHubGraphQL.Objects.StarredRepositoryConnection
    case "PageInfo": return GitHubGraphQL.Objects.PageInfo
    case "SearchResultItemConnection": return GitHubGraphQL.Objects.SearchResultItemConnection
    case "Mutation": return GitHubGraphQL.Objects.Mutation
    case "AddStarPayload": return GitHubGraphQL.Objects.AddStarPayload
    case "RemoveStarPayload": return GitHubGraphQL.Objects.RemoveStarPayload
    default: return nil
    }
  }
}

public enum Objects {}
public enum Interfaces {}
public enum Unions {}
