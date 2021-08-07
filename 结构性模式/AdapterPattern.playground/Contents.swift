import Foundation
import SwiftUI

protocol RoundPegProtocol {
  func getRadius() -> Double
}

// 圆孔
class RoundHole {
  private let radius: Double
  init(radius: Double) {
    self.radius = radius
  }

  func fit(peg: RoundPegProtocol) -> Bool {
    radius >= peg.getRadius()
  }
}

// 圆钉
class RoundPeg: RoundPegProtocol {
  private let radius: Double
  init(radius: Double) {
    self.radius = radius
  }

  func getRadius() -> Double {
    radius
  }
}

// 方钉
class SquarePeg {
  private let width: Double
  init(width: Double) {
    self.width = width
  }

  func getWidth() -> Double {
    width
  }
}

// 把方钉转换成圆钉
class SquarePegAdapter: RoundPegProtocol {
  private let squarePeg: SquarePeg

  init(squarePeg: SquarePeg) {
    self.squarePeg = squarePeg
  }

  func getRadius() -> Double {
    let width = squarePeg.getWidth()
    return sqrt(2 * width * width) / 2.0
  }
}

let roundHole = RoundHole(radius: 5)
let roundPeg = RoundPeg(radius: 5)
print(roundHole.fit(peg: roundPeg))

let small_sqpeg = SquarePeg(width: 5)
let large_sqpeg = SquarePeg(width: 10)
// roundHole.fit(peg: small_sqpeg) 不能通过编译
let small_sqpeg_adapter = SquarePegAdapter(squarePeg: small_sqpeg)
let large_sqpeg_adapter = SquarePegAdapter(squarePeg: large_sqpeg)

print(roundHole.fit(peg: small_sqpeg_adapter))
print(roundHole.fit(peg: large_sqpeg_adapter))
