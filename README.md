# Swift_SimpleNetworkLibrary

[![CI Status](https://travis-ci.org/SwapnilSankla/Swift_SimpleNetworkLibrary.svg?branch=master)](https://travis-ci.org/SwapnilSankla/Swift_SimpleNetworkLibrary)
[![Version](https://img.shields.io/cocoapods/v/Swift_SimpleNetworkLibrary.svg?style=flat)](https://cocoapods.org/pods/Swift_SimpleNetworkLibrary)
[![License](https://img.shields.io/cocoapods/l/Swift_SimpleNetworkLibrary.svg?style=flat)](https://cocoapods.org/pods/Swift_SimpleNetworkLibrary)
[![Platform](https://img.shields.io/cocoapods/p/Swift_SimpleNetworkLibrary.svg?style=flat)](https://cocoapods.org/pods/Swift_SimpleNetworkLibrary)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

Swift_SimpleNetworkLibrary is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Swift_SimpleNetworkLibrary'
```

## GET Request
Let's try to use a cool REST API http://dummy.restapiexample.com/api/v1/employees. This API provides us a dummy set of employees. The employee looks something like below.
``` swift
struct Employee: Codable {
    let employee_name: String
    let employee_salary: String
    let employee_age: String
}
```
Now to fetch employee details from the API, we just need to call get method on NetworkLayer.

```swift
let successHandler: ([Employee]) -> Void = { (employees) in
  print(employees)
}

let errorHandler: (String) -> Void = { (error) in
  print(error)
}

NetworkLayer().get(urlString: "http://dummy.restapiexample.com/api/v1/employees",
                   headers: ["key": "value"],
                   successHandler: successHandler,
                   errorHandler: errorHandler)
```
The coolest part is the Codable protocol which makes the network layer generic. Also check that Swift's strong type inference incredibly helps us as while calling get method, we don't specify the type in which we are expecting a response. Cool isn't it?

## POST Request
POST is equally simple!
```swift
let emp1 = Employee(name: "Test_123", salary: "12234", age: "22")
NetworkLayer().post(urlString: "http://dummy.restapiexample.com/api/v1/create",
                    headers: ["key": "value"],
                    body: emp1,
                    errorHandler: errorHandler)
```

## Author

Swapnil Sankla, swapnil.sankla@gmail.com

## License

Swift_SimpleNetworkLibrary is available under the MIT license. See the LICENSE file for more info.
