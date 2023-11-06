// swiftlint:disable all
import Amplify
import Foundation

public struct AllEvents: Model {
  public let id: String
  public var currentEvent: Event?
  public var previousEvent: [Event?]?
  public var wallet: Wallet?
  public var createdAt: Temporal.DateTime?
  public var updatedAt: Temporal.DateTime?
  
  public init(id: String = UUID().uuidString,
      currentEvent: Event? = nil,
      previousEvent: [Event?]? = nil,
      wallet: Wallet? = nil) {
    self.init(id: id,
      currentEvent: currentEvent,
      previousEvent: previousEvent,
      wallet: wallet,
      createdAt: nil,
      updatedAt: nil)
  }
  internal init(id: String = UUID().uuidString,
      currentEvent: Event? = nil,
      previousEvent: [Event?]? = nil,
      wallet: Wallet? = nil,
      createdAt: Temporal.DateTime? = nil,
      updatedAt: Temporal.DateTime? = nil) {
      self.id = id
      self.currentEvent = currentEvent
      self.previousEvent = previousEvent
      self.wallet = wallet
      self.createdAt = createdAt
      self.updatedAt = updatedAt
  }
}