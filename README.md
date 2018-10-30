
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

__Networking__, __tableview__, __user defaults__, __data parsing__, __etc...__, are the most common things among many more which we use in almost every project, so why do we repeat the same work again and again if there is something that do that work for us like a boss !! 😎😎.
</p>

## Index

- [Features](#features)
- [Upcoming features](#upcoming-features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Quick start](#quick-start)
- [How to use](#how-to-use-highlights)
- [FAQs](#faqs)
- [Credits](#credits)
- [Help me improve the documentation](#help-me-improve-the-documentation)
- [Author](#author)
- [Contributers](#contributers)
- [Contact US](#contact-us)
- [License](#license)

<br>

## Features

1. Only import boot strap.
2. Abstract network layer (Unified error + unified result closure).
3. Generic error manager.
4. Unified parser.
5. Tableview adapter with empty data set handler.
6. Reusable table view adapter.
7. Toast messages component ( Like the one in Android 😉 ).
8. Simplified syntax ( Dequeue cell, go to Viewcontroller programatically ).
9. Custom pickers  ( List, date, time, date & time, multi lists ).
10. Customizable progress dialog.
11. Unified base model for objects parsing (Serialize & deserialize).
12. Unified base push notification model for push notification payload parsing.
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
23. Collection view adapter.
24. Reusable collection view adapter.
25. Table and collection views pagination handler.
26. Added Kingfisher  library.
27. Coordinator design pattern + viewcontrollers naviagator base class + examples
28. Simple depenfancy injection implementation.
29. Refresh token plugin for moya.
30. Refresh token RX Swift plugin.
31. Real time listeners for token update/expire event ( Work with 29 or 30 but not alone ).
32. HandyJSON Moya plugin.
33. HandyJSON RX Swift plugin.
34. Out of the box build variants ( Debug - Staging - Release ) auto handler.
35. Read/Write Files/Folder managers.
36. In app localization manager ( No need tor restart your app 😉 ).
37. Cleaner localization syntax.
38. UI button show/hide loading extension.
39. Show/hode loading in any vew controller
40. BaseTableAdapterController,  BaseTableAdapterPresenter, BaseCollectionAdapterController,  BaseCollectionAdapterPresenter to save you somtime and code when you implement table or collection view.
41. You can call getUserDefaults from BaseController and BasePresenter by default.
42. Phone number validator string extension.
43. Includes **SCLAlertView** awesone swift library.
44. ViewPager (AKA : Segmented controller) as the one in Android 😁.
45. Automated Contexts injection.
46. Added UITabBar controller MVP base class.
47. Updated the default configurations Class to use builder design pattern instead of static methods.
48. Added a new network gneric completion handler in addition to the older ones.
49. Cancel any newtowrk request out of the box.
50. How to use and documentation + references.


## Upcoming features

1. Date and Time manager.
2. Push notification manager.
3. More extensions! Please if there is an extension you are constantly using, send a pull request now.


## Requirements

- iOS 9.1+
- Xcode 9.2+
- Swift 4.1 +

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

## Note

There is a project generator to help you buld things faster at thils [Link](https://github.com/ahmadmssm/iOS_Bootstrap-generator/releases), Enjoy 😎.


## Quick start

Just import  `iOS_Bootstrap` and your are ready to go.

>
- For almost every feature available in this __Pod__  their is an example or how to use file or a link to an example or explanation.
- For any thing not clear or for help, please  __[contact me](#contact-us)__ or open a bug and i will assist you as soon as i can.


## How to use \(Highlights\)


#### Table view adabter :
Insetead of repeating tableview code every time you need a tableview, you can do the following :
- First comfirm to the protocol named  `TableViewDelegates` and make your custom cell confirm to the `BaseTableViewCell`, then

```swift
let tableAdapter : TableviewAdapter = TableviewAdapter()
tableAdapter.configureTableWithXibCell(tableView: tableview, dataSource: dataSource, nibClass: TableViewCell.self, delegate: self)
```
- Then all you have to do is to configure your cell and all the other delegates will be  handeled automatically, unless you want to handle it by yourself .

> You can also use the `ReusableTableViewAdapter` if you have similar tableviews.

#### Dequeuing cell simplified syntax :
Ues this

`let cell : TableViewCell = tableview.dequeueReusableCell(forIndexPath: indexPath)`

Instead of this

`let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell`

#### Empty data set delegates :
Deal with tableview in case the data source is empty or nil.

#### Storyboard and Viewcontroller navigation simplified syntax ;and less typo errors :
Use this

```swift
let storyboard = UIStoryboard.getStoryboardWithName(Storyboard.home.rawValue)
let homeVC = storyboard.instantiateInitialViewController() as! HomeVC
present(homeVC, animated: true, completion: nil)
```

Instead of this

``` swift
let storyboard : UIStoryboard = UIStoryboard(name: "Home", bundle:nil)
let homeVC = storyboard.instantiateViewControllerWithIdentifier("nextView") as! HomeVC
self.presentViewController(homeVC, animated:true, completion:nil)
```

#### Erros in one place + Human readable errors :
When you use Alamofire, you get success and fail result and the failure closure will be called only if there is a network failure but if there is a server failure like forexample 404, 500, etc.., they all come in the success closure and you have to handle this by yourself, i found this wierd so if you used the  `GenericErrorHandler` along with the network abstract layer, you can do filter the result of the result closure using the following operators  `.filterSuccessfulStatusCodes()` & `processErrors()`, you can even localise the server messages in case your app. were in different languages.

-  Your network request will be something simple like that (A request to get all the world countries) :

```swift
func getAllCountries (completion: @escaping completionHandler) {
    let _ = apiProvide.rx
            .request(.getWorldCountries())
            .filterSuccessfulStatusCodes()
            .processErrors()
            .mapString()
            .subscribe { event in
                switch event {
                case .success(let responseString):
                    let countries : [Country] = Parser.arrayOfObjectsFromJSONstring(object: Country.self, JSONString: responseString)! as! [Country]
                    completion(.success(countries as AnyObject))
                case .error(let error):
                    completion(.failure(error.localizedDescription))
                    }
            }
}
```

#### Unified result closure :
A close that returns a result of any type and an error string.

#### Unified parser :

Just make your model calss or strucut confirm to the `BaseModel` delegate the you can use the `Parser` class easily whiclh converts to the most wanted types.

#### Keyboard handler :

If you want the keyboard to automatically hide when you press outside the textfield, instead of handling it by yourself in almost every View, you can call `KeyboardManager.handleKeyboardManager()` in your app delegate function `didFinishLaunchingWithOptions` and that is it 😎.

#### Loggers :

Instead of filling your code with statemetns which is not good plus it will affetct your code when your release it to production, you can use `Log` class which is pretty readable in the console plus it works only in the debug mode and you can debug with error, info., warning, server and more.

`Log.error("There is an error ")`


>Many many more ( About 23 features ), you can find more details in the examples associated with the pod and if anything is not clear just contact me.



### Note :

>Due to a bug in Cocoapods, so the Storyboard sometimes many fail to render if you added a custom `@IBDesignable` view to a component in storyboard and this custom `@IBDesignable` view was in the pod files path (Any pod not just my pod) and not your project files path, so to solve this problem please add the following code to the end of your pod file.


>
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

1.  <b style='color:red'>__Do i need to add Alamofire pod to my project ?__</b><br>
No, you do not need to do so since Alamofire will be installed  once you add  the `iOS_Bootstrap` to your project.

2. <b style='color:red'>__Waht if i need to use Alamofire or anyother dependacy from the `iOS_Bootstrap`, What i have to do ?__</b><br>
All you have to do is to import the library to your view controller instead of importing `iOS_Bootstrap`.




## Credits

The following awesome libraries are used as dependancies in my pod :

1. [Alamofire](https://github.com/Alamofire/Foundation).
2. [Moya](https://github.com/Moya/Moya).
3. [HandyJSON](https://github.com/alibaba/HandyJSON).
4. [IQKeyboardManager](https://github.com/hackiftekhar/IQKeyboardManager).
5. [Kingfisher](https://github.com/onevcat/Kingfisher)
6. [SCLAlertView](https://github.com/vikmeup/SCLAlertView-Swift).

In addition, the following Repos helped me alot either by including their code directly into my pod or using some portion of their codes to improve my things or to learn something new so __**thank you**__ for sharing your awesome codes for free to the community.

1. [EZLoadingActivity](https://github.com/goktugyil/EZLoadingActivity).
2. [MoyaSugar](https://github.com/devxoul/MoyaSugar).
3. [Lucid](https://github.com/levibostian/Lucid).
4. [ActionSheetPicker-3.0](https://github.com/skywinder/ActionSheetPicker-3.0).
5. [ADTPagerController](https://github.com/tungvoduc/DTPagerController).
6. [Bartinter](https://github.com/MaximKotliar/Bartinter).
7. [SlideMenuControllerSwift](https://github.com/dekatotoro/SlideMenuControllerSwift).


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

