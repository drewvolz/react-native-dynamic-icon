# react-native-dynamic-icon

Change your iOS react native app icon.

_The following readme is mostly background info copied from [hackingwithswift.com](https://www.hackingwithswift.com/example-code/uikit/how-to-change-your-app-icon-dynamically-with-setalternateiconname). Check their site out!_

### 1. Add alternate icons to your Xcode project

To get started, we need some icons. These should be placed loose in your project or in a group, rather than inside an asset catalogue. Remember to use the @2x and @3x naming convention to ensure iOS automatically picks the correct icon for users' devices.

### 2. Modify your project's `info.plist`

Go to your project navigator, right-click your `Info.plist` file, and choose "Open As > Source Code". This will reveal the raw XML behind your plist.

Defining the icons for your app is done with a very specific set of property list keys and values. To be quite clear, `CFBundleIcons` is a dictionary containing the key `CFBundleAlternateIcons`, which is a dictionary containing the key `YourImageName`, which is another dictionary containing the icon files and gloss effect settings.

1. `CFBundleIcons` is a dictionary that defines what your primary icon is (`CFBundlePrimaryIcon`) and what your alternate icons are (`CFBundleAlternateIcons`)
2. The primary icon key itself is a dictionary that lists its icon files (`CFBundleIconFiles`), which is an array containing the filenames for your primary icon, and whether iOS should apply gloss effects to it (`UIPrerenderedIcon`). Yes, that latter setting has been dead since iOS 7 but it still loiters around.
3. The alternate icons key is also a dictionary, but this time the keys of its children are the names of images you want to use. This doesn’t need to be their filename, just however you want to reference each icon in your code.
4. Each icon name is another dictionary, which contains the same two keys as `CFBundlePrimaryIcon`: the `CFBundleIconFiles` array and the `UIPrerenderedIcon` boolean.

Notes:
* You can rename `icon_type_1` and `YourImageName`
* Add more entries under `CFBundleAlternateIcons` if you want more than one alternate icon.
* Note: Do not put the @2x or @3x parts into your plist, and don’t add the .png either.

```xml
<key>CFBundleIcons</key>
<dict>
  <key>CFBundleAlternateIcons</key>
  <dict>
    <key>icon_type_1</key>
    <dict>
      <key>CFBundleIconFiles</key>
      <array>
        <string>YourImageName</string>
      </array>
      <key>UIPrerenderedIcon</key>
      <true/>
    </dict>
  </dict>
</dict>
```

## 3. Installation

`$ npm install github:drewvolz/react-native-dynamic-icon`
### (a) Mostly automatic installation
`$ react-native link react-native-dynamic-icon`
### (b) Manual installation
1. In Xcode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-dynamic-icon` and add `ReactNativeDynamicIcon.xcodeproj`
3. In Xcode, in the project navigator, select your project. Add `libReactNativeDynamicIcon.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd + R`)

## 4. Usage

```js
import ReactNativeDynamicIcon from 'react-native-dynamic-icon'

// Setting an alternate icon
ReactNativeDynamicIcon.setIconName("Foobar")

// Setting default
ReactNativeDynamicIcon.setIconName("Default")
```

## Todo

* [ ] get alternateIconName

<hr>

## Resources

##### Apple's Docs

Method | What it does
--|--
[`supportsAlternateIcons`](https://developer.apple.com/documentation/uikit/uiapplication/2806815-supportsalternateicons?language=objc) | A Boolean value indicating whether the app is allowed to change its icon.
[`alternateIconName`](https://developer.apple.com/documentation/uikit/uiapplication/2806808-alternateiconname?language=objc) | The name of the icon being displayed for the app.
[`setAlternateIconName`](https://developer.apple.com/documentation/uikit/uiapplication/2806818-setalternateiconname?language=objc) | Changes the app's icon.

##### Other sites

Source | What's to learn
--|--
[hackingwithswift.com](https://www.hackingwithswift.com/example-code/uikit/how-to-change-your-app-icon-dynamically-with-setalternateiconname) |  How to change your app icon dynamically
[steventroughtonsmith](https://github.com/steventroughtonsmith/AlternateIconTest) | AlternateIconTest github example
