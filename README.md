
<h1 align ="center">
<b style='color:#2270FF'>
iOS_Bootstrap
</b>
for Swift</h1>


<p align="center">
<a href="https://cocoapods.org/pods/iOS_Bootstrap"><img src="https://img.shields.io/cocoapods/v/iOS_Bootstrap.svg?style=flat"></a>
<a href="https://cocoapods.org/pods/iOS_Bootstrap"><img src="https://img.shields.io/cocoapods/p/iOS_Bootstrap.svg?style=flat"></a>
<a href="https://cocoapods.org/pods/iOS_Bootstrap"><img src="https://img.shields.io/badge/Swift-4.0-F16D39.svg?style=flat"></a>
<a href="https://cocoapods.org/pods/iOS_Bootstrap/"><img src="https://img.shields.io/cocoapods/l/iOS_Bootstrap.svg?style=flat"></a>
<a ><img src="https://img.shields.io/github/last-commit/ahmadmssm/iOS_Bootstrap.svg?style=flat"></a>

</p>




## Overview
<p style='color:#2270FF'>

__Networking__, __tableview__, __user defaults__, __data parsing__, __etc...__, are the most common things among many more whic we use in almost every project, so why do we repeat the same work again and again if there is somthing that do that work for us like a boss !! 😎😎.
</p>

## Index

- [Features](#features)
- [Upcoming features](#upcoming-features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Quick start](#quick-start)
- [How to use](#how-touse)
- [FAQ](#faqs)
- [Credits](#credits)
- [Help me improve the documentation](#help-me-improve-the-documentation)
- [Author](#author)
- [Contributers](#contributers)
- [Contact US](#contact-us)
- [License](#license)

<br>

## Features

1. Only import boot strap.
2. Abstract network layer (Unifed error + unified result closure).
3. Generic error manager.
4. Unified parser.
5. Tableview adapter with empty data set handler.
6. Reusable table view adapter.
7. Toast meassages component ( Like the one in Android 😉 ).
8. Simpliefied syntax ( Deque cell, go to Viewcontroller programatically ).
9. Custom pickers  ( List, date, time, date & time, multi lists ).
10. Customizable progress dialog.
11. Unifed base model for objects parsing (Serialize & deserialize).
12. Unifed base push notification model for push notification payload parsing.
13. User defaults manager.
14. Base collection and table view cells.
15. Only one delegate for collection view & one for table view ( Including empty data set ).
16. Singleton logger class ( Like the one in Android 😉 ).
17. Useful extensions (String to dictionary, remove duplicates from array, hex to UI color, UIlabel partial text formatting, UIimage + GIF)
18. Customizable UIview.
19. Customizable Cardview.
20. Customizable UIbutton.
21. Customizable toggle button ( Check box + radio button ).
22. Keyboard handler
23. How to use and documentaion + references.

## Upcoming features

1. Collection view adapter.
2.  Reusable collection view adapter.
3. Pagination handler.
4. Date and time manager.
5. Push notification manager.
6. Social media manager.
7. More extensions! Please if there is an extension you are constantly using, send a pull request now.
8. Documentations inside code .



## Requirements

- iOS 9.1+
- Xcode 9.2+
- Swift 4.0 +

## Installation

You can integrate __iOS_Bootstrap__ into your project using __[CocoaPods](http://cocoapods.org)__.

__[CocoaPods](http://cocoapods.org)__ is a dependency manager for iOS Cocoa projects, You can install it with the following command:

```bash
$ gem install cocoapods
```

> CocoaPods 1.1+ is required to build __iOS_Bootstrap__.

To integrate __iOS_Bootstrap__ into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'iOS_Bootstrap'
```

Then run the following command:

```bash
$ pod install
```

Once your project is integrated with the __iOS_Bootstrap__ , you can pull updates using the following command:

```bash
$ pod update
```

## Quick start

Just import  `iOS_Bootstrap` and your are ready to go.

>
- For almost every feature available in this __Pod__  their is an example or how to use file or a link to an example or explination.
- For any thing not clear or for help, please  __[contact me](#Contact-US-:)__ or open a bug and i will assist you as soon as i can.


## How to use :


Due to a bug in Cocoapods, so the Storyboard sometimes many fail to render if you added a custom ```@IBDesignable``` view to a component in storyboard and this custom ```@IBDesignable``` view was in the pod files path (Any pod not just my pod) and not your project files path, so to solve this problem please add the following code to the end of your pod file.


```ruby
# Workaround for Cocoapods issue #7606
post_install do |installer|
    installer.pods_project.build_configurations.each do |config|
        config.build_settings.delete('CODE_SIGNING_ALLOWED')
        config.build_settings.delete('CODE_SIGNING_REQUIRED')
    end
end
```
> For more details, please see this __[link](https://github.com/CocoaPods/CocoaPods/issues/7606#issuecomment-381279098)__




## FAQs

1.  <b style='color:red'>__Do i need to install Alamofire ?__</b><br>
No, you do not need to do so since Alamofire will be installed  once you add  the `iOS_Bootstrap` to your project.

2. <b style='color:red'>__Waht if i need to use Alamofire or anyother dependacy from the `iOS_Bootstrap`, What i have to do ?__</b><br>
All you have to do is to import the library to your view comtroller instead of importing `iOS_Bootstrap`.




## Credits

The following awesome libraries are used as dependanceis in my pod :

1. [Alamofire](https://github.com/Alamofire/Foundation).
2. [Moya](https://github.com/Moya/Moya).
3. [HandyJSON](https://github.com/alibaba/HandyJSON).
4. [IQKeyboardManager](https://github.com/hackiftekhar/IQKeyboardManager).
5. [SNSSocial](https://github.com/smartnsoft/SNSSocial).

In addition, Rhe following repos helped me alot either by including there code directly into my pod or used some portion of there codes to improve my things or to learn somthing new so __**thank you**__ for sharing your awesome codes for free to the community.

1. [EZLoadingActivity](https://github.com/goktugyil/EZLoadingActivity).
2. [MoyaSugar](https://github.com/devxoul/MoyaSugar).
3. [Lucid](https://github.com/levibostian/Lucid).
2. [ActionSheetPicker-3.0](https://github.com/skywinder/ActionSheetPicker-3.0).

## Help me improve the documentation

As a developer trying this pod out for the first time, you can make a valuable contribution by improving the documentation.

-  Send a feedback about something you thought was confusing or simply missing.
-  Suggesting better wording or ways of explaining certain topics.
-  A pull request via GitHub.
-  Bug reports, feature requests, patches, well-wishes, and rap demo tapes are always welcome.


## Author

<b style='color:#2270FF'>Ahmad Mahmoud Saleh</b>


## Contributers

<br>

## Contact US
- [Mail](mailto:ams.eng@hotmail.com "Send Mail")
- [Github](https://github.com/ahmadmssm "Author's Github account")






## License

__iOS_Bootstrap__ is released under the MIT license. __[See License](https://github.com/ahmadmssm/iOS_Bootstrap/blob/master/LICENSE)__ for details.

---

