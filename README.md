# YMLogoAlert
[![Version](https://img.shields.io/cocoapods/v/YMLogoAlert.svg?style=flat)](https://cocoapods.org/pods/YMLogoAlert)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![SwiftPM](https://img.shields.io/badge/SPM-supported-DE5C43.svg?style=flat)](https://swift.org/package-manager/)
[![License](https://img.shields.io/cocoapods/l/YMLogoAlert.svg?style=flat)](https://cocoapods.org/pods/YMLogoAlert)
[![Platform](https://img.shields.io/cocoapods/p/YMLogoAlert.svg?style=flat)](https://cocoapods.org/pods/YMLogoAlert)



## About YMLogoAlert
![YMLogoAlert mov](https://user-images.githubusercontent.com/42762236/137061604-d5fca03e-5242-42c7-b671-8bbe00117eba.gif)

- A simple custom alert.
- YMLogoAlert lets you pop up a simple alert with a natural animation, your app's own color, font and a logo image (in logo case if you need)

## Example
```swift
//YMLogoAlert1
YMLogoAlert(title: "Title content with no message", color: .systemTeal , buttonStyle: .confirmAndCancel, okCompletion: nil)
    .showAlert(in: view)
    
//YMLogoAlert2
YMLogoAlert(title: "This is a title content", message: "This is a message content. Put your message.", color: .systemYellow , completion: nil)
    .showAlert(in: view)
    
//YMLogoAlert3
YMLogoAlert(title: "This is a title content", message: "This is a message content. Put your message.", color: .systemRed, imageName: "ExampleImage" , completion: nil)
    .showAlert(in: view)
    
//YMLogoAlert4
YMLogoAlert(title: "This is a title content", message: "This is a message content. Put your message.", color: .systemGreen, imageName: "ExampleImage"  , buttonStyle: .confirmAndCancel, okCompletion: nil)
    .showAlert(in: view)
```


## Requirements
- iOS 13.0
- Swift 5


## Installation

### CocoaPods

YMLogoAlert is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'YMLogoAlert'
```

### Carthage
```ruby
github Youngminah/YMLogoAlert
```

### Swift Package Manager
```ruby
https://github.com/Youngminah/YMLogoAlert.git
```

## Author

- **Youngminah**
- E-mail: bluebelsmudi@gmail.com

## License

YMLogoAlert is available under the MIT license. See the LICENSE file for more info.
