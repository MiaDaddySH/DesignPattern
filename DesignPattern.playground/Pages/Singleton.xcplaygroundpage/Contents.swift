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

//最简单的单例
class MySingleton {
  static let shared = MySingleton()
  private init() {}
}
