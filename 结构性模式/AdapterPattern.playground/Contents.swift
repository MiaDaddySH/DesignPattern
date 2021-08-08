import Foundation
import SwiftUI

protocol ShapeProtocol {
  var color: ColorProtocol? { get set }
  func draw()
}

protocol ColorProtocol {
  func show()
}

struct Blue: ColorProtocol {
  func show() {
    print("I am blue")
  }
}

struct Red: ColorProtocol {
  func show() {
    print("I am red")
  }
}

struct Green: ColorProtocol {
  func show() {
    print("I am green")
  }
}

struct Circle: ShapeProtocol {
  var color: ColorProtocol?
  func draw() {
    print("I am a circle!")
    color?.show()
  }
}

struct Square: ShapeProtocol {
  var color: ColorProtocol?
  func draw() {
    print("I am a square!")
    color?.show()
  }
}

var redCircle: ShapeProtocol = Circle(color: Red())
redCircle.draw()
