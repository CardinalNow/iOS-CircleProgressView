iOS CircleProgressView 
======

This control will allow a user to use code instantiated or interface builder to create and render a circle progress view.
 
This repository is referenced in the blog post: --LINK--

Features
------

* Increase or decreasing progress changes.
* Variable track width.
* Track image optional.
* Track background color.
* Track fill color.
* Track border color.
* Track border width.
* Center fill color.

Requirements
-------

XCode 6
Swift
iOS 7 +

Configuration
-------

* If you are using a swift only project simply copy CircleProgressView.swift to your project. Swift requires no specific imports.

* If you are using a hybrid app where you are starting with an objective c project, you will need to import the swift class by full name. 

```Objective-C
#import "CircleProgressView-Swift.h"
```

Usage
-------

CircleProgressView can be used via code or interface builder. 

* If configuring via code, use the traditional init methods and properties.

* If using Interface Builder, CircleProgressView takes advantage of XCode 6's new ```Swift @IBDesignable ``` and ```Swift @IBInspectable ``` properties that allow developers to render and configure custom controls in Interface Builder.

Preview
-------

Interface Builder live rendering.
![Live Rendering](https://raw.githubusercontent.com/CardinalNow/iOS-CircleProgressView/master/ScreenShots/ss_4.png)

Interface Builder control configurations.
![Controls](https://raw.githubusercontent.com/CardinalNow/iOS-CircleProgressView/master/ScreenShots/ss_03.png)

App Preview
![Preview Simulator](https://raw.githubusercontent.com/CardinalNow/iOS-CircleProgressView/master/ScreenShots/ss_01.png)
![Preview Simulator](https://raw.githubusercontent.com/CardinalNow/iOS-CircleProgressView/master/ScreenShots/ss_2.png)

## Author / License

Copyright Cardinal Solutions 2013. Licensed under the MIT license.
![LOGO](https://raw.github.com/CardinalNow/NSURLConnection-Debug/master/logo_footer.png)
