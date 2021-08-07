
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

enum MobileType {
  case apple, huawei, xiaomi
}

struct PhoneFactory {
  static func createMobile(_ type: MobileType) -> Mobile {
    switch type {
      case .apple:
        return Iphone()
      case .huawei:
        return HuaweiPhone()
      default:
        return MiPhone()
    }
  }
}

struct MobileStore {
  func sellMobile(phone: Mobile) {
    print("Store begins to sell phone: \(phone)")
  }
}

let mobileStore = MobileStore()
let mobile = PhoneFactory.createMobile(.xiaomi)
mobile.packing()
mobileStore.sellMobile(phone: mobile)

