import Foundation
import SwiftUI

class MyClassSingleton {
  static let sharedInstance = MyClassSingleton()
  private init() {}
  var state = 5
  func helloClass() { print("hello from class Singleton: \(state)") }
}

// Struct类型的是不能作为单例的

struct MyStructSingleton {
  static let sharedInstance = MyStructSingleton()
  private init() {}
  var state = 5
  func helloStruct() { print("hello from struct Singleton: \(state)") }
}

let ss = MyClassSingleton.sharedInstance
ss.state = 12
MyClassSingleton.sharedInstance.helloClass()

var sss1 = MyStructSingleton.sharedInstance
sss1.state = 12
MyStructSingleton.sharedInstance.helloStruct()

// 最简单的单例.纯粹的单例
class MySingleton {
  static let shared = MySingleton()
  private init() {}
}

//这个单例的init方法是public的，可以任意创建多个对象。。
class MySingletonPlus {
  static let shared = MySingletonPlus()
  //public init() {}
  var state = 5
  func helloStruct() { print("hello from struct Singleton: \(state)") }
}
let singletonPlus = MySingletonPlus.shared
let singletonPlus2 = MySingletonPlus()

