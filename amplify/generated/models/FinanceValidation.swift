// swiftlint:disable all
import Amplify
import Foundation

public struct FinanceValidation: Model {
  public let id: String
  public var createdAt: Temporal.DateTime?
  public var updatedAt: Temporal.DateTime?
  
  public init(id: String = UUID().uuidString) {
    self.init(id: id,
      createdAt: nil,
      updatedAt: nil)
  }
  internal init(id: String = UUID().uuidString,
      createdAt: Temporal.DateTime? = nil,
      updatedAt: Temporal.DateTime? = nil) {
      self.id = id
      self.createdAt = createdAt
      self.updatedAt = updatedAt
  }
}