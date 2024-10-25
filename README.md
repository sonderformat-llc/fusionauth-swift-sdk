[![Latest Release Tag](https://badgen.net/github/tag/fusionauth/fusionauth-ios-sdk)](https://github.com/FusionAuth/fusionauth-ios-sdk/tags)
[![Dependabot](https://badgen.net/github/dependabot/fusionauth/fusionauth-ios-sdk)](https://github.com/FusionAuth/fusionauth-ios-sdk/network/updates)
[![Open PRs](https://badgen.net/github/open-prs/fusionauth/fusionauth-ios-sdk)](https://github.com/FusionAuth/fusionauth-ios-sdk/pulls)

An SDK for using FusionAuth in iOS Apps.

# Table of Contents

- [Overview](#overview)

- [Getting Started](#getting-started)

- [Usage](#usage)

- [Example App](#example-app)

- [Quickstart](#quickstart)

- [Documentation](#documentation)

- [Upgrade Policy](#upgrade-policy)

<!--
this and following tags, and the corresponding end tag, are used to delineate what is pulled into the FusionAuth docs site (the client libraries pages). Don't remove unless you also change the docs site.

Please also use ``` instead of indenting for code blocks. The backticks are translated correctly to adoc format.
-->

## Overview
<!--
tag::forDocSiteOverview[]
-->
This SDK allows you to use OAuth 2.0 and OpenId Connect functionality in an iOS app with FusionAuth as the
authorization server. It also provides a Token Manager to store, refresh, and retrieve tokens.

It's a highly standardized and simplified starting point for developers to easily integrate FusionAuth into their own custom mobile apps by taking care of all the dependencies.

Following OAuth 2.0 and OpenID Connect functionality are covered:
- OAuth 2.0 Authorization Code Grant
- OAuth 2.0 Refresh Token Grant
- OpenID Connect UserInfo
- OpenID Connect End Session

[AppAuth-iOS](https://github.com/openid/AppAuth-iOS) is used for the OAuth 2.0 Authorization Code Grant flow and OpenID Connect functionality.

The SDK is written in Swift and compatible with Object-C.
<!--
end::forDocSiteOverview[]
-->

## Getting Started

<!--
tag::forDocSiteGettingStarted[]
-->
To use the FusionAuth iOS SDK, add this repository as a dependency.

Initialize the AuthorizationManager with the AuthorizationConfiguration.

```swift
extension AuthorizationManager {
    
    public static let shared: AuthorizationManager = {
        let instance = AuthorizationManager.instance
        instance.initialize(configuration: AuthorizationConfiguration(
            clientId: "e9fdb985-9173-4e01-9d73-ac2d60d1dc8e",
            fusionAuthUrl: "http://localhost:9011",
            additionalScopes: ["email", "profile"]))
        return instance
    }()
    
}
```

This will initialize the AuthorizationManager with the provided AuthorizationConfiguration. The configuration includes the client id, FusionAuth URL, additional scopes and storage mechanism. The AuthorizationManager is a singleton and can be accessed from anywhere in the app. The example configuration uses your local FusionAuth instance. If you are running the FusionAuth server on a different machine, you will need to replace the fusionAuthUrl with the correct URL.

By default, the SDK uses the `MemoryStorage for storing tokens. You can use one of the other available mechanisms `KeyChainStorage`or `UserDefaultsStorage` by e.g. adding `storage: KeyChainStorage` to `instance.initialize` or implement your own storage mechanism by implementing the Storage protocol.
<!--
end::forDocSiteGettingStarted[]
-->

## Usage

<!--
tag::forDocSiteUsage[]
-->
To start the OAuth 2.0 Authorization Code Grant, you can use the `oAuth()` function on the `AuthorizationManager` to
retrieve the `OAuthAuthorizationService`:

```swift
try await AuthorizationManager.shared
    .oauth()
    .authorize(options: OAuthAuthorizeOptions())
    } catch {
        print("Error occured")
    }
```

The `authorize` method will open the Safari browser and redirect to the FusionAuth login page. After successful login, the user will be redirected back to the app with the authorization code. The SDK will exchange the authorization code for an access token and refresh token.

TODO

The `authorize` function will start the OAuth 2.0 Authorization Code Grant flow and open the provided `Intent` when the
flow is completed.
The `OAuthAuthorizeOptions` allows you to specify additional options for the flow, such as the `cancelIntent` and
the `state`.

If the user completes the flow, the `TokenActivity` will be opened, and you are required to handle the redirect:

```swift
AuthorizationManager.oAuth(this@TokenActivity)
    .handleRedirect(intent)
```

This will retrieve the authorization response, validates the `state` if it was provided, and exchanges the authorization
code for an access token.
The result of the exchange will be stored in the `TokenManager`.

After the user is authorized, you can use `getUserInfo()` to retrieve the [User Info](https://openid.net/specs/openid-connect-core-1_0.html#UserInfo):

```swift
AuthorizationManager.oAuth(this@TokenActivity).getUserInfo()
```

To call your API with an access token, you can use the `AuthorizationManager` to retrieve a valid access token:

```swift
val accessToken = AuthorizationManager.freshAccessToken(this@TokenActivity)
```

This will retrieve a fresh access token from the `TokenManager` and return it. If the access token is expired,
the `TokenManager` will refresh it automatically.

Finally, you can use the `AuthorizationManager` to sign out the user and remove the tokens from the `TokenManager`:

```swift
AuthorizationManager
    .oAuth(this@TokenActivity)
    .logout(
        Intent(this@TokenActivity, LoginActivity::class.java)
            .setFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP)
    )
```

If the user is signed out, the `LoginActivity` will be opened.
<!--
end::forDocSiteUsage[]
-->

## Example App

<!--
tag::forDocSiteExampleApp[]
-->
See the [FusionAuth iOS SDK Example](https://github.com/FusionAuth/fusionauth-quickstart-swift-ios-fusionauth-sdk) for a functional example of an iOS client that uses the SDK.
<!--
end::forDocSiteExampleApp[]
-->

## Quickstart

<!--
tag::forDocSiteQuickstart[]
-->
See the [FusionAuth iOS Quickstart](https://fusionauth.io/docs/quickstarts/quickstart-ios-swift-native-fusionauth-sdk/) for a full tutorial on using FusionAuth and iOS.
<!--
end::forDocSiteQuickstart[]
-->

## Documentation

<!--
tag::forDocSiteDocumentation[]
-->
See the latest [Full library documentation](https://github.com/FusionAuth/fusionauth-ios-sdk/blob/main/Documentation/Reference/README.md) for the complete documentation of the SDK.
<!--
end::forDocSiteDocumentation[]
-->

## Upgrade Policy

This library may periodically receive updates with bug fixes, security patches, tests, code samples, or documentation changes.

These releases may also update dependencies, language engines, and operating systems, as we\'ll follow the deprecation and sunsetting policies of the underlying technologies that the libraries use.

This means that after a dependency (e.g. language, framework, or operating system) is deprecated by its maintainer, this library will also be deprecated by us, and may eventually be updated to use a newer version.
