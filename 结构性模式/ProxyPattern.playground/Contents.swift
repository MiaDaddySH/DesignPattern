import Foundation
import SwiftUI

protocol PaymentProtocol {
  func receivePayment(money: Double)
}

final class HouseOwner: PaymentProtocol {
  private var money: Double?
  func receivePayment(money: Double) {
    self.money = money
    print("House owner receive payment with \(money)")
  }
}

final class HouseProxy: PaymentProtocol {
  private var agentFee: Double?
  var houseOwner: HouseOwner?

  init(houseOwner: HouseOwner) {
    self.houseOwner = houseOwner
  }

  func receivePayment(money: Double) {
    print("House buyer give payment with \(money)")
    agentFee = money * 0.03
    print("House agent receives payment with \(agentFee ?? 0)")
    houseOwner?.receivePayment(money: money * 0.97)
  }
}

let proxy = HouseProxy(houseOwner: HouseOwner())
proxy.receivePayment(money: 10000)
