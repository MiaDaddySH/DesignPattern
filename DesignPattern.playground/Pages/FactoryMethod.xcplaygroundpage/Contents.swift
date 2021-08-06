
import Foundation

protocol Mobile {
  func packing()
}

struct Iphone: Mobile {
  func packing() {
    print("iPhone is ready for you")
  }
}

struct HuaweiPhone: Mobile {
  func packing() {
    print("Hua Wei Phone is ready for you")
  }
}

struct MiPhone: Mobile {
  func packing() {
    print("Xiaomi Phone is ready for you")
  }
}
protocol PhoneFactory {
  func cretePhone() -> Mobile
}

struct iPhoneFactory: PhoneFactory{
  func cretePhone() -> Mobile {
    Iphone()
  }
}

struct HuaweiPhoneFactory: PhoneFactory{
  func cretePhone() -> Mobile {
    HuaweiPhone()
  }
}

struct MiPhoneFactory: PhoneFactory{
  func cretePhone() -> Mobile {
    MiPhone()
  }
}

struct MobileStore {
  func buildPhone(factory: PhoneFactory) -> Mobile {
    factory.cretePhone()
  }
  func sellMobile(phone: Mobile) {
    print("Store begins to sell phone: \(phone)")
  }
}

let mobileStore = MobileStore()

let mobile = mobileStore.buildPhone(factory: HuaweiPhoneFactory())
mobile.packing()
mobileStore.sellMobile(phone: mobile)
