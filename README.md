# HJFullScreen

[![CI Status](https://img.shields.io/travis/keithmorning/HJFullScreen.svg?style=flat)](https://travis-ci.org/keithmorning/HJFullScreen)
[![Version](https://img.shields.io/cocoapods/v/HJFullScreen.svg?style=flat)](https://cocoapods.org/pods/HJFullScreen)
[![License](https://img.shields.io/cocoapods/l/HJFullScreen.svg?style=flat)](https://cocoapods.org/pods/HJFullScreen)
[![Platform](https://img.shields.io/cocoapods/p/HJFullScreen.svg?style=flat)](https://cocoapods.org/pods/HJFullScreen)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

It  can be easy to use as follow 

```
lazy var movePlayerView = MoviePlayerView()
lazy var contentView:HJFullViewContainer = {
    let view = HJFullViewContainer(content: self.movePlayerView)
    return view
}()

self.view.addSubview(contentView)

let vc = CustomViewController() //neet override the supportedInterfaceOrientations as [.landscapeRight,.landscapeLeft]

/// full screen
self.contentView.fullScreen(fullScreenVc: fullscreenVc) {} 
```

If you want to custom the palyerView on the fullScreenVc's location, you can make the fullScreenVc implete the protocol  `HJFullScreenAction`

```
/// in fullScreenVc wirte this code

func addTageToView(target: UIView) {
    self.view.addSubview(target)
    self.view.sendSubview(toBack: target)
}

```

## Requirements

## Installation

HJFullScreen is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'HJFullScreen'
```

## Author

keithmorning,

## License

HJFullScreen is available under the MIT license. See the LICENSE file for more info.
