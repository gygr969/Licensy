# Licensy

[![CocoaPods compatible](https://img.shields.io/cocoapods/v/Licensy.svg?style=flat)](https://cocoapods.org/pods/Licensy) [![License: MIT](https://img.shields.io/cocoapods/l/Licensy.svg?style=flat)](http://opensource.org/licenses/MIT)

`Licensy` is an iOS drop-in class that allow you to display a table listing all the 3rd Party Libraries that you are using in your app, and preview some data about it's licenses and copyrights.

## Requirements

`Licensy` works on iOS 9+ and requires ARC to build. It depends on the following Apple frameworks, which should already be included with most Xcode templates:

* Foundation.framework
* UIKit.framework

You will need the latest developer tools in order to build `Licensy`. Old Xcode versions might work, but compatibility will not be explicitly maintained.

## Adding Licensy to your project

### CocoaPods

[CocoaPods](http://cocoapods.org) is the recommended way to add Licensy to your project.

1. Add a pod entry for Licensy to your Podfile `pod 'Licensy'`
2. Install the pod(s) by running `pod install`.
3. Include Licensy wherever you need it with `@import Licensy` if your project is in Objective-C or `import Licensy` if your project is in Swift.