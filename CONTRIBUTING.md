# Contributing
<!--
tag::forDocSiteContributing[]
-->
We hope you love using FusionAuth iOS SDK, but in case you encounter a bug or an issue with the SDK, please do let us know.

Please only report issues for the FusionAuth iOS SDK itself if you have an issue with documentation or a client library follow [these instructions.](https://github.com/FusionAuth/fusionauth-issues)

## Community Guidelines

As part of the FusionAuth community, please abide by [the Code of Conduct](https://fusionauth.io/community/forum/topic/1000/code-of-conduct).

## Reporting an Issue

Before reporting an issue, please search through the already open issues to see if you could contribute.

To report an issue, please follow the instructions of the bug, feature and general issue templates.

## Contributing Features and Fixes

Before starting with contributing, you'll want to look at and choose an issue to work on. Here is a basic workflow you want to work from:

1. Search the issue tracker for an issue that you want to work on. If your issue does not exist, please create a new one.
2. Search GitHub for an open or closed Pull Request that relates to the issue you want to work on. You may find that someone else is already working on it, or that the issue is already resolved in a different branch.

You can find all the open issues [here](https://github.com/FusionAuth/fusionauth-ios-sdk/issues).

Once you have found an issue you want to work on, we suggest to:

1. Fork the repository to your personal account.
2. Create a new branch with the name fix/issue-id or feat/issue-id.
3. And start working on that branch on the issue.

## Development Tooling

During development of new features and fixes, we suggest using the following code quality tools which are preconfigured for this project:

### SourceDocs

To generate documentation for the project.

Installation: `brew install sourcedocs`

Generate Documentation: `sourcedocs generate -- -scheme FusionAuth`

### SwiftLint

To enforce Swift style and conventions.

Installation: `brew install swiftlint`

Run SwiftLint: `swiftlint`

## Submitting a Pull Request

When you are ready to submit your pull request, visit the main repository on GitHub and click the "Compare & pull request" button. Here you can select the branch you have been working on and create a pull request.

If you're creating a pull request for an issue, please include `Closes #XXX` in the message body where `#XXX` is the issue you're fixing. For example, `Closes #42` would close issue #42.

After you have submitted your pull request, several checks will be run to ensure the changes meet the project's guidelines. If they do, the pull request will be reviewed by a maintainer and subsequently merged.
<!--
end::forDocSiteContributing[]
-->