import SwiftUI

struct Car {}

struct Menual {}

protocol Builder {
  func reset()
  func setSeats()
  func setEngine()
  func setTripComputer()
  func setGPS()
}

class CarBuilder: Builder {
  var result: Car?
  func reset() {
    result = Car()
  }
  
  func setSeats() {
    print("Car set seats")
  }
  
  func setEngine() {
    print("Car set engine")
  }
  
  func setTripComputer() {
    print("Car set trip computer")
  }
  
  func setGPS() {
    print("Car set GPS")
  }
  
  func getProduct() -> Car? {
    return result
  }
}

class MenualBuilder: Builder {
  var result: Menual?
  func reset() {
    result = Menual()
  }
  
  func setSeats() {
    print("Menual set seats")
  }
  
  func setEngine() {
    print("Menual set engine")
  }
  
  func setTripComputer() {
    print("Menual set trip computer")
  }
  
  func setGPS() {
    print("Menual set GPS")
  }
  
  func getProduct() -> Menual? {
    return result
  }
}

struct Director {
  var builder: Builder
  func constructSportsCar(withBuilder builder: Builder) {
    builder.reset()
    builder.setSeats()
    builder.setEngine()
    builder.setTripComputer()
    builder.setGPS()
  }
  
  func constructSUV(withBuilder builder: Builder) {
    builder.reset()
    builder.setSeats()
    builder.setEngine()
    builder.setTripComputer()
    builder.setGPS()
  }
}
