// swiftlint:disable all
import Amplify
import Foundation

public struct AllEvents: Model {
  public let id: String
  public var currentEvent: Event?
  public var previousEvent: [Event?]?
  public var createdAt: Temporal.DateTime?
  public var updatedAt: Temporal.DateTime?
  
  public init(id: String = UUID().uuidString,
      currentEvent: Event? = nil,
      previousEvent: [Event?]? = nil) {
    self.init(id: id,
      currentEvent: currentEvent,
      previousEvent: previousEvent,
      createdAt: nil,
      updatedAt: nil)
  }
    
  internal init(id: String = UUID().uuidString,
      currentEvent: Event? = nil,
      previousEvent: [Event?]? = nil,
      createdAt: Temporal.DateTime? = nil,
      updatedAt: Temporal.DateTime? = nil) {
      self.id = id
      self.currentEvent = currentEvent
      self.previousEvent = previousEvent
      self.createdAt = createdAt
      self.updatedAt = updatedAt
  }
}
