// swiftlint:disable all
import Amplify
import Foundation

public struct Wallet: Model {
  public let id: String
  public var value: Double?
  public var createdAt: Temporal.DateTime?
  public var updatedAt: Temporal.DateTime?
  
  public init(id: String = UUID().uuidString,
      value: Double? = nil) {
    self.init(id: id,
      value: value,
      createdAt: nil,
      updatedAt: nil)
  }
  internal init(id: String = UUID().uuidString,
      value: Double? = nil,
      createdAt: Temporal.DateTime? = nil,
      updatedAt: Temporal.DateTime? = nil) {
      self.id = id
      self.value = value
      self.createdAt = createdAt
      self.updatedAt = updatedAt
  }
}