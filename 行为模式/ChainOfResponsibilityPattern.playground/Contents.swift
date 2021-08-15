import Foundation
import SwiftUI

enum MoneyUnit: Int {
  case fifty = 50
  case twenty = 20
  case ten = 10
}

protocol DispenseChainNodeProtocol {
  var nextNode: DispenseChainNodeProtocol? { get set }
  var unit: MoneyUnit { get }
}

extension DispenseChainNodeProtocol {
  func dispense(amount: Int) {
    let unit = unit.rawValue
    if amount >= unit {
      let count = amount / unit
      let remainder = amount % unit

      print("Dispensing \(count) of \(unit)")

      if remainder != 0 {
        nextNode?.dispense(amount: remainder)
      }
    } else {
      nextNode?.dispense(amount: amount)
    }
  }
}

struct DispenseChainNodeFor50: DispenseChainNodeProtocol {
  let unit: MoneyUnit = .fifty
  var nextNode: DispenseChainNodeProtocol?
}

struct DispenseChainNodeFor20: DispenseChainNodeProtocol {
  let unit: MoneyUnit = .twenty
  var nextNode: DispenseChainNodeProtocol?
}

struct DispenseChainNodeFor10: DispenseChainNodeProtocol {
  let unit: MoneyUnit = .ten
  var nextNode: DispenseChainNodeProtocol?
}

struct ATMDispenseChain {
  let nextNode: DispenseChainNodeProtocol = DispenseChainNodeFor50(
    nextNode: DispenseChainNodeFor20(nextNode: DispenseChainNodeFor10())
  )

  func dispense(amount: Int) {
    print("==================================")
    print("ATM start dispensing of amount: \(amount)")

    guard amount % 10 == 0 else {
      print("Amount should be in multiple of 10, please try again!")
      return
    }
    nextNode.dispense(amount: amount)
  }
}

let atm = ATMDispenseChain()
atm.dispense(amount: 230)
atm.dispense(amount: 30)
atm.dispense(amount: 10)
atm.dispense(amount: 23)
