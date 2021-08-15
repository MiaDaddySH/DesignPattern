import Foundation
import SwiftUI

protocol LightProtocol {
  func lightOn()
  func lightOff()
}

struct Light: LightProtocol {
  func lightOn() {
    print("Light on")
  }

  func lightOff() {
    print("Light off")
  }
}

protocol CommandProtocol {
  func excute()
}

struct CommandLightOn: CommandProtocol {
  var light: LightProtocol
  func excute() {
    light.lightOn()
  }
}

struct CommandLightOff: CommandProtocol {
  var light: LightProtocol
  func excute() {
    light.lightOff()
  }
}

protocol RemoteControlProtocol {
  mutating func setCommand(command: CommandProtocol)
  func pressButton()
}

struct RemoteControl: RemoteControlProtocol {
  private var command: CommandProtocol?

  mutating func setCommand(command: CommandProtocol) {
    self.command = command
  }

  func pressButton() {
    command?.excute()
  }
}

let light = Light()
let lightOn = CommandLightOn(light: light)
let lightOff = CommandLightOff(light: light)
var remoteControl = RemoteControl()
remoteControl.setCommand(command: lightOn)
remoteControl.pressButton()

remoteControl.setCommand(command: lightOff)
remoteControl.pressButton()
