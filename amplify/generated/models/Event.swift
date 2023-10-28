// swiftlint:disable all
import Amplify
import Foundation

public struct Event: Model {
  public let id: String
  public var eventName: String
  public var eventDate: String?
  public var eventMembers: [EventMember?]?
  public var createdAt: Temporal.DateTime?
  public var updatedAt: Temporal.DateTime?
  
  public init(id: String = UUID().uuidString,
      eventName: String,
      eventDate: String? = nil,
      eventMembers: [EventMember?]? = nil) {
    self.init(id: id,
      eventName: eventName,
      eventDate: eventDate,
      eventMembers: eventMembers,
      createdAt: nil,
      updatedAt: nil)
  }
  internal init(id: String = UUID().uuidString,
      eventName: String,
      eventDate: String? = nil,
      eventMembers: [EventMember?]? = nil,
      createdAt: Temporal.DateTime? = nil,
      updatedAt: Temporal.DateTime? = nil) {
      self.id = id
      self.eventName = eventName
      self.eventDate = eventDate
      self.eventMembers = eventMembers
      self.createdAt = createdAt
      self.updatedAt = updatedAt
  }
}