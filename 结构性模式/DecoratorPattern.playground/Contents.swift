import Foundation
import SwiftUI

protocol Salad {
  func getDescription() -> String
  func price() -> Double
}

protocol SauceDecorator: Salad {
  var salad: Salad { set get }
}

struct VegetableSalad: Salad {
  func getDescription() -> String { "[Vegetable Salad]" }

  func price() -> Double { 5 }
}

struct ChickenSalad: Salad {
  func getDescription() -> String { "[Chicken Salad]" }

  func price() -> Double { 10 }
}

struct BeefSalad: Salad {
  func getDescription() -> String { "[Beef Salad]" }

  func price() -> Double { 16 }
}

struct VinegarSauceDecorator: SauceDecorator {
  var salad: Salad

  func getDescription() -> String { "\(salad.getDescription()) + vinegar sauce" }

  func price() -> Double { salad.price() + 2 }
}

struct PeanutButterSauceDecorator: SauceDecorator {
  var salad: Salad

  func getDescription() -> String { "\(salad.getDescription()) + peanus butter sauce" }

  func price() -> Double { salad.price() + 4 }
}

struct BlueBerrySauceDecorator: SauceDecorator {
  var salad: Salad

  func getDescription() -> String { "\(salad.getDescription()) + blue berry sauce" }

  func price() -> Double { salad.price() + 6 }
}

//================== client ==================
var vSalad: Salad = VegetableSalad()
print(vSalad.getDescription())

vSalad = VinegarSauceDecorator(salad: vSalad)
print(vSalad.getDescription())
vSalad = BlueBerrySauceDecorator(salad: vSalad)

print(vSalad.getDescription())
print("The price is \(vSalad.price())")

var bSalat:Salad = BeefSalad()
bSalat = PeanutButterSauceDecorator(salad: bSalat)
bSalat = PeanutButterSauceDecorator(salad: bSalat)
bSalat = BlueBerrySauceDecorator(salad: bSalat)
print(bSalat.getDescription())
print("The price is \(bSalat.price())")
