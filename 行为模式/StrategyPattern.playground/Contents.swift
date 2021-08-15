import Foundation
import SwiftUI

protocol TwoIntOperation {
  func operation(ofInt1 int1: Int, andInt2 int2: Int) -> Int
}

struct TwoIntAdd: TwoIntOperation {
  func operation(ofInt1 int1: Int, andInt2 int2: Int) -> Int {
    int1 + int2
  }
}

struct TwoIntSubstract: TwoIntOperation {
  func operation(ofInt1 int1: Int, andInt2 int2: Int) -> Int {
    int1 - int2
  }
}

struct TwoIntMultiply: TwoIntOperation {
  func operation(ofInt1 int1: Int, andInt2 int2: Int) -> Int {
    int1 * int2
  }
}

struct TwoIntDivision: TwoIntOperation {
  func operation(ofInt1 int1: Int, andInt2 int2: Int) -> Int {
    int1 / int2
  }
}

protocol ContextProtocol {
  func setOperation(_ operation: TwoIntOperation)
  func excuteOperation(ofInt1 int1: Int, andInt2 int2: Int) -> Int
}

final class Context: ContextProtocol {
  private var operation: TwoIntOperation

  init(witOperation operation: TwoIntOperation) {
    self.operation = operation
  }

  func setOperation(_ operation: TwoIntOperation) {
    self.operation = operation
  }

  func excuteOperation(ofInt1 int1: Int, andInt2 int2: Int) -> Int {
    operation.operation(ofInt1: int1, andInt2: int2)
  }
}

let context: ContextProtocol = Context(witOperation: TwoIntAdd())
let addResult = context.excuteOperation(ofInt1: 12, andInt2: 13)
print("Add result :\(addResult)")
context.setOperation(TwoIntMultiply())
let multiResult = context.excuteOperation(ofInt1: 34, andInt2: 2)
print("Multiply result :\(multiResult)")
