import Foundation
import SwiftUI

enum FlowerType: CaseIterable {
  case Anemone, Cosmos, Gerberas, Hollyhock, Jasmine, Zinnia
}

protocol FlowerFactoryProtocol {
  func flower(withType type: FlowerType) -> FlowerProtocol
}

protocol FlowerProtocol {}
struct Flower: FlowerProtocol {
  var type: FlowerType
}

final class FlowerFactory: FlowerFactoryProtocol {
  var flowers: [FlowerType: FlowerProtocol] = [:]

  static let shared = FlowerFactory()
  private init() {}

  func flower(withType type: FlowerType) -> FlowerProtocol {
    if let flower = flowers[type] {
      print("reusing flower with type:\(type)")
      return flower
    } else {
      let flower = Flower(type: type)
      print("create new flower with type:\(type)")
      flowers[type] = flower
      return flower
    }
  }
}

//================== client ==================
let flowerFactory = FlowerFactory.shared
for _ in 0 ..< 30 {
  let type = FlowerType.allCases.randomElement()!
  _ = flowerFactory.flower(withType: type)
}
