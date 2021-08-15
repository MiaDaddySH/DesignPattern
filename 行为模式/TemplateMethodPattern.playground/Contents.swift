import Foundation
import SwiftUI

protocol HotDrink {
  func addMainMaterial()
  func addIngredients()
}

extension HotDrink {
  func makingProcess() {
    prepareHotWater()
    addMainMaterial()
    addIngredients()
  }

  private func prepareHotWater() {
    print("Prepare hot water!")
  }
}

struct HotDrinkTea: HotDrink {
  func addMainMaterial() {
    print("Add tea leaf")
  }

  func addIngredients() {
    print("Add nothing")
  }
}
struct HotDrinkLatte: HotDrink {
  func addMainMaterial() {
    print("Add ground coffee")
  }
  
  func addIngredients() {
    print("Add milk")
  }
}

let hotTea = HotDrinkTea()
hotTea.makingProcess()

let latte = HotDrinkLatte()
latte.makingProcess()
