<p align="center">
<img src="readme-resources/logo.png" style="max-height: 300px;" alt="Licensy for iOS">
</p>



[![CocoaPods compatible](https://img.shields.io/cocoapods/v/Licensy.svg?style=flat)](https://cocoapods.org/pods/Licensy) [![License: MIT](https://img.shields.io/cocoapods/l/Licensy.svg?style=flat)](http://opensource.org/licenses/MIT) [![Swift Version](https://img.shields.io/badge/Swift-3.0.2-orange.svg?style=flat)](https://developer.apple.com/swift/) [![Platform](https://img.shields.io/badge/platform-iOS-lightgrey.svg)](https://developer.apple.com/ios/)



<p align="center">
<img src="readme-resources/example.gif" style="max-height: 569px;" alt="Licensy for iOS">
</p>

Copyright © David Jimenez Guinaldo & Guillermo Garcia Rebolo.

`Licensy` is an iOS drop-in class that allow you to display a table listing all the 3rd Party Libraries that you are using in your app, and preview some data about it's licenses and copyrights.

## Requirements

`Licensy` works on iOS 9+ and requires ARC to build. It depends on the following Apple frameworks, which should already be included with most Xcode templates:

* Foundation.framework
* UIKit.framework

You will need the latest developer tools in order to build `Licensy`. Old Xcode versions might work, but compatibility will not be explicitly maintained.

## Installation

[CocoaPods](http://cocoapods.org) is the recommended way to add Licensy to your project.

```ruby
pod 'Licensy'
```
1. Install the pod(s) by running `pod install`.
2. Include Licensy wherever you need it with `@import Licensy` if your project is in Objective-C or `import Licensy` if your project is in Swift.

## Usage
Basic usage of this library involves creating a `UITableView` with the class `LicensyTable that provides our pod and adding the libraries included in your app.

### 'Libraries' Structure
A `Library` is an object containing all the information about the library being used and its license:

 Property | Description | Example
 -------- | ----------- | -------
 name | The name of the library | `"Licensy"`
 organization | The name of the organization that created the library | `"RetoLabs"`
 url | The url where you can found the library | `"https://github.com/guille969/Licensy"`
 copyright | The copyright information for the library | `"Copyright (c) 2017 RetoLabs"`
 license | The license the library uses | `MITLicense()`

 As you can tell from above the `license` is a property of type `License`, there are some of the more usually used and that `Licensy` provides:

 Name | JSON Indetifier
 -------- | -------
 Apache Software License 2.0 | `"ASL20"`
 BSD 3-Clause License | `"BSD3"`
 Creative Commons Attribution-NoDerivs 3.0 Unported | `"CCAND"`
 GNU General Public License 2.0 | `"GPL20"`
 GNU General Public License 3.0 | `"GPL30"`
 GNU Lesser General Public License 2.1 | `"LGPL"`
 ISC License | `"ISC"`
 MIT License | `"MIT"`
 Mozilla Public License, Version 2.0 | `"MPL20"`

Also you can create your custom license with the object class `CustomLicense` to build one license that is not listed above.

### Add Libraries from objects

You can create yout library objects and provide them to the 'Licensy' table to list them.
You can see the detailed examples in the example in this repository.

``` swift
//Load tableView with an array on Library
let librariesArray: Array<LibraryEntity> = [
    LibraryEntity(name: "Library 1", organization: "RetoLabs", url: "info@github.com", copyright: "Guillermo Garcia Rebolo", license: MITLicense()),
    LibraryEntity(name: "Library 2", organization: "RetoLabs", url: "info@github.com", copyright: "David Jiménez Guinaldo", license: ApacheSoftwareLicense20()),
    LibraryEntity(name: "Library 3", organization: "RetoLabs", url: "info@github.com", copyright: "Guillermo Garcia Rebolo", license: GnuGeneralPublicLicense30()),
    LibraryEntity(name: "Library 4", organization: "RetoLabs", url: "info@github.com", copyright: "David Jiménez Guinaldo", license: GnuGeneralPublicLicense30())
]
tableView.setLibraries(librariesArray)
```


### Add Libraries from JSON
You can list all of your libraries and their licenses in a json file included in your app bundle, with a format as such:

``` json
{
    "libraries": [
        {
            "name": "Licensy",
            "organization": "RetoLabs",
            "url": "https://github.com/guille969/Licensy",
            "copyright": "Copyright (C) 2017 RetoLabs",
            "license": "MIT"
        },
        {
            "name": "MGBottomSheet",
            "organization": "Guillermo Garcia Rebolo",
            "url": "https://github.com/guille969/MGBottomSheet",
            "copyright": "Copyright (C) 2017 Guillermo Garcia Rebolo",
            "license": "MIT"
        }
    ]
}
```
For use it you can call in your view controller the next code:

```swift
//libraries is the name of the JSON file in your project with your 3rd Party libraries
let path = Bundle.main.path(forResource: "libraries", ofType: "json")!
self.tableView.setLibraries(forJsonResourcePath: path)
```

or this other way, only providing the name of the JSON resource:

```swift
tableView.setLibraries(forJsonResourceName: "librerias")
```

### Customize appearance
You are able to customize some style properties:

 Property | Description | Example
 -------- | ----------- | -------
 headerContentColor | An UIColor for the header title, underline header and his accesory | `UIColor.white`
 headerBackgroundColor | An UIColor for the header background | `UIColor(red:0.15, green:0.30, blue:0.38, alpha:1.0)`
 accentColor | An UIColor for the library link and the license button | `UIColor(red:0.00, green:0.50, blue:0.50, alpha:1.0)`
 roundLicenseButton | A boolean property to round or not the license button corners | `true`
 accesory | An enumaration property to choose between 2 different kind of accesory styles (.arrow or .plus) | `.arrow`
 licenseSize | An enumaration property to choose between 2 different kind of license formats (.minimal or .extended) | `.minimal`

 Example of customization: 

``` swift
tableView.appearance.accentColor = UIColor.red
tableView.appearance.roundLicenseButton = true
tableView.appearance.accesory = .plus
tableView.appearance.licenseSize = .extended
```

We provide you 3 different predefined styles:

<table align="center", cellpadding=10>
<tr>
   <td><img src="readme-resources/default-style.png" style="max-height: 1100px;" alt="Licensy for iOS"></td>
    <td><img src="readme-resources/ios-style.png" style="max-height: 1100px;" alt="Licensy for iOS"></td>
    <td><img src="readme-resources/orangefit-style.png" style="max-height: 1100px;" alt="Licensy for iOS"></td>
  </tr>
  <tr>
       <td align="center">Default style</td>
       <td align="center">iOS style</td>
       <td align="center">Orange fit</td>
  </tr>
</table>


 Applying a predefined style: 

 ``` swift
 tableView.appearance.setIOSDefaultAppearance() //iOS style
 tableView.appearance.setOrangeFitAppearance() //Orange fit
 ```


