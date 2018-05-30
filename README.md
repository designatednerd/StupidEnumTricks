# StupidEnumTricks
Code from my talk about Stupid Enum Tricks in Swift and Kotlin

# Kotlin


# Swift/iOS

This application uses enums in Swift for a number of things: 

- Assets in the asset catalog
- Localized Strings
- Helping to define what buttons, labels, and text views are available in a particular view controller. 
- Handling Segues
- Input state for a given text input

Most of this is pretty straighforward, but there's one thing that's a little bit odd: Some enums in the `ViewControllers` folder are pulled out into separate files. 

This is because unfortunately, even if you make your enums and protocols public in your application bundle, you  cannot import anything from your application bundle into an XCUI test bundle. 

Personally, this is why XCUI testing drives me up a wall and I use other tools like [KIF](https://github.com/kif-framework/KIF) and [Earl Grey](https://github.com/google/EarlGrey), which run in the same process as the the application and allow you to use `@testable import` of your application like a civilized person.

However, if you need or prefer to use XCUI for whatever reason, to take advantage of using these enums for localized strings, you need to make sure that you've added your `Localizable.strings` file and your wrapper class to your XCUI test bundle. 