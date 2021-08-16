import Foundation
import SwiftUI

//被观察的目标
protocol Subject {
  var observers: [Observer] { get set }
  func addObserver(observer: Observer)
  func removeObserver(observer: Observer)
  func notifyObservers()
}

class FinancialAdviser: Subject {
  var buyingPrice: Double = 0
  var observers = [Observer]()

  func addObserver(observer: Observer) {
    observers.append(observer)
  }

  func removeObserver(observer: Observer) {
    observers.filter { $0.id != observer.id }
  }

  func notifyObservers() {
    observers.forEach {
      $0.update(buyingPrice)
    }
  }
}

protocol Observer {
  var id: Int { get set }
  func update(_ buyingPrice: Double)
}

struct Investor: Observer {
  var id: Int
  
  func update(_ buyingPrice: Double) {
    print("The buying Price for investor is \(buyingPrice)")
  }
}

struct Employee: Observer {
  var id: Int
  
  func update(_ buyingPrice: Double) {
    print("The buying Price for employee is \(buyingPrice)")
  }
}


let investor1 = Investor(id: 1)
let investor2 = Investor(id: 2)
let employee = Employee(id: 3)
let financialAdviser = FinancialAdviser()
financialAdviser.addObserver(observer: investor1)
financialAdviser.addObserver(observer: investor2)
financialAdviser.addObserver(observer: employee)

financialAdviser.buyingPrice = 12.4
financialAdviser.notifyObservers()
