import Foundation
import SwiftUI

protocol Device {
  func on()
  func off()
}

class Light: Device {
  func on() {
    print("Light is On")
  }

  func off() {
    print("Light is off")
  }
}

class TV: Device {
  func on() {
    print("TV is On")
  }

  func off() {
    print("TV is off")
  }
}

class Curtain: Device {
  func on() {
    print("Curtain is Opened")
  }

  func off() {
    print("Curtain is closed")
  }
}

class DeviceRemoter {
  var devices = [Device]()

  private let light: Light
  private let tv: TV
  private let curtain: Curtain

  init(
    light: Light = Light(),
    tv: TV = TV(),
    curtain: Curtain = Curtain()
  ) {
    self.light = light
    self.tv = tv
    self.curtain = curtain
    
    devices.append(curtain)
    devices.append(light)
    devices.append(tv)
  }

  func wakeUpMode() {
    print("Start wake up mode for you!")
    curtain.on()
    light.off()
    tv.on()
  }

  func sleepMode() {
    print("Start sleep mode for you!")
    devices.forEach {
      $0.off()
    }
  }
}

let remoter = DeviceRemoter()
remoter.wakeUpMode()

remoter.sleepMode()
