# StravaSwift

[![CI Status](http://img.shields.io/travis/mpclarkson/StravaSwift.svg?style=flat)](https://travis-ci.org/mpclarkson/StravaSwift)
[![Version](https://img.shields.io/cocoapods/v/StravaSwift.svg?style=flat)](http://cocoapods.org/pods/StravaSwift)
[![License](https://img.shields.io/cocoapods/l/StravaSwift.svg?style=flat)](http://cocoapods.org/pods/StravaSwift)
[![Platform](https://img.shields.io/cocoapods/p/StravaSwift.svg?style=flat)](http://cocoapods.org/pods/StravaSwift)

This is a Swift wrapper for [Strava v3 API](https://strava.github.io/api/).

As this is a passion project, I only work on it when I have time. So, if you are interested in contributing, feel free to submit PRs.

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

StravaSwift is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "StravaSwift"
```

## Quick Start

The full library documentation is available (here](http://cocoadocs.org/docsets/StravaSwift).

* First, you must [register your app](http://labs.strava.com/developers/) with Strava and get an oAuth `client id` and `client secret`.

* Initialize the Strava Client as follows, preferably in your `AppDelegate.swift` to ensure it is configured before you call it:

```swift
  let config = StravaConfig(
    clientId: YourStravaClientId,
    clientSecret: YourStravaClientSecret,
    redirectUri: YourRedirectUrl, //Don't forget to register this scheme in your info.plist
)

StravaClient.sharedInstance.initWithConfig(config)
```

* Note, by default the oAuth token is only available while the app is running, which means you need to request a new token. You can implement custom token storage and retrieval behaviour by overriding the default token `delegate` in the `StravaConfig` initializer which must implement the `TokenDelegate` protocol.

* Register your redirect URL scheme in your info.plist.

* Implement the following method in your `AppDelegate.swift` to handle the oAuth redirection from Strava:

```swift
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        guard let code = strava?.handleAuthorizationRedirect(url) else { return false }
        //Exchange the code for a token
        strava.getAccessToken(code) { token in
            //Do something if you want, but the token is already available to the
            //StravaClient thanks to the TokenDelegate
        }
        return true
    }
```

* Now you can start requesting resources (note the Router implementation is based on this 
Alamofire [example](https://github.com/Alamofire/Alamofire#api-parameter-abstraction). For example:

```swift

let strava = StravaClient.sharedInstance

strava.request(Router.Athlete) { [weak self] (athlete: Athlete?) in
    guard let `self` = self, athlete = athlete else { return }
    //do something with the athlete
}

let params = [
    'page' = 2,
    'per_page' = 25
]

strava.request(Router.AthleteActivities(params)) { [weak self] (activities: [Activity]?) in
    guard let `self` = self, activities = activities else { return }
   //do something with the activities
}
```

## Todos

[ ] Documentation 

[ ] Tests

[ ] Error handling

## Author

Matthew Clarkson, mpclarkson@gmail.com

## License

StravaSwift is available under the MIT license. See the LICENSE file for more info.
