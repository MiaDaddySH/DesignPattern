import Foundation
import SwiftUI

protocol CoderProtocol {}

struct Coder: CoderProtocol {
  var currentState: StateProtocol?

  func wakeUp() {
    currentState?.wakeUp()
  }

  func fallAsleep() {
    currentState?.fallAsleep()
  }

  func startCoding() {
    currentState?.startCoding()
  }

  func startEating() {
    currentState?.startEating()
  }
}

protocol StateProtocol {
  func wakeUp()
  func fallAsleep()
  func startCoding()
  func startEating()
}

struct StateAwake: StateProtocol {
  var coder: Coder
  func wakeUp() {
    print("Already awake, can not change state to awake again")
  }

  func fallAsleep() {
    print("Change state from awake to sleeping")
    coder.fallAsleep()
  }

  func startCoding() {
    print("Change state from awake to start coding")
    coder.startCoding()
  }

  func startEating() {
    print("Change state from awake to start eating")
    coder.startEating()
  }
}

struct StateSleeping: StateProtocol {
  var coder: CoderProtocol
  func wakeUp() {
    print("Already awake, can not change state to awake again")
  }

  func fallAsleep() {
    print("Change state from awake to sleeping")
  }

  func startCoding() {}

  func startEating() {}
}

struct StateEating: StateProtocol {
  var coder: CoderProtocol
  func wakeUp() {
    print("Already awake, can not change state to awake again")
  }

  func fallAsleep() {
    print("Change state from awake to sleeping")
  }

  func startCoding() {}

  func startEating() {}
}

struct StateCoding: StateProtocol {
  var coder: CoderProtocol
  func wakeUp() {
    print("Already awake, can not change state to awake again")
  }

  func fallAsleep() {
    print("Change state from awake to sleeping")
  }

  func startCoding() {}

  func startEating() {}
}

let coder = Coder(currentState: StateAwake())
