
import Foundation

protocol Mobile {
  func packing()
}

protocol Notebook {
  func packing()
}

struct Iphone: Mobile {
  func packing() {
    print("iPhone is ready for you")
  }
}

struct MacBook: Notebook {
  func packing() {
    print("MacBook is ready for you")
  }
}

struct HuaweiPhone: Mobile {
  func packing() {
    print("Hua Wei Phone is ready for you")
  }
}

struct HWNoteBook: Notebook {
  func packing() {
    print("Hua Wei Notebook is ready for you")
  }
}

struct MiPhone: Mobile {
  func packing() {
    print("Xiaomi Phone is ready for you")
  }
}

struct MiNoteBook: Notebook {
  func packing() {
    print("Xiaomi Notebook is ready for you")
  }
}

protocol Factory {
  func cretePhone() -> Mobile
  func creteNoteBook() -> Notebook
}

struct iPhoneFactory: Factory {
  func cretePhone() -> Mobile {
    Iphone()
  }
  
  func creteNoteBook() -> Notebook {
    MacBook()
  }
}

struct HuaweiPhoneFactory: Factory {
  func cretePhone() -> Mobile {
    HuaweiPhone()
  }
  
  func creteNoteBook() -> Notebook {
    HWNoteBook()
  }
}

struct MiPhoneFactory: Factory {
  func cretePhone() -> Mobile {
    MiPhone()
  }
  
  func creteNoteBook() -> Notebook {
    MiNoteBook()
  }
}

struct MobileStore {
  var factory: Factory
  init(factory: Factory) {
    self.factory = factory
  }
  
  func bookPhone() -> Mobile {
    factory.cretePhone()
  }
  
  func bookNoteBook() -> Notebook {
    factory.creteNoteBook()
  }
  
  func sellMobile(_ phone: Mobile) {
    print("Store begins to sell phone: \(phone)")
  }
  
  func sellNotebook(_ noteBook: Notebook) {
    print("Store begins to sell Notebook: \(notebook)")
  }
}

let mobileStore = MobileStore(factory: MiPhoneFactory())
let phone = mobileStore.bookPhone()
let notebook = mobileStore.bookNoteBook()
mobileStore.sellMobile(phone)
mobileStore.sellNotebook(notebook)
