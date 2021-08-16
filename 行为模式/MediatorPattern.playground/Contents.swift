import Foundation
import SwiftUI

protocol UserProtocol {
  var name: String { get set }
  func sendMessage(message: String)
  func receiveMessage(message: String)
}

protocol ChatMediatorProtocol {
  func addUser(user: UserProtocol)
  func notify(message: String, fromUser user: UserProtocol)
}

struct User: UserProtocol {
  var mediator: ChatMediatorProtocol?
  var name: String
  func sendMessage(message: String) {
    print("\(name) has sent a message: \(message)")
    mediator?.notify(message: message, fromUser: self)
  }

  func receiveMessage(message: String) {
    print("\(name) has received a message: \(message)")
  }
}

class Mediator: ChatMediatorProtocol {
  var users = [UserProtocol]()
  func addUser(user: UserProtocol) {
    users.append(user)
  }

  func notify(message: String, fromUser sendingUser: UserProtocol) {
    users.forEach { user in
      if user.name != sendingUser.name {
        user.receiveMessage(message: message)
      }
    }
  }
}

let mediator = Mediator()
let user1 = User(mediator: mediator, name: "user1")
let user2 = User(mediator: mediator, name: "user2")
let user3 = User(mediator: mediator, name: "user3")
mediator.addUser(user: user1)
mediator.addUser(user: user2)
mediator.addUser(user: user3)

user1.sendMessage(message: "Happy")
user2.sendMessage(message: "new")
user3.sendMessage(message: "year!")



