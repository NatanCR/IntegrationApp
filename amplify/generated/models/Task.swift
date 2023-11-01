// swiftlint:disable all
import Amplify
import Foundation

public struct Task: Model {
  public let id: String
  public var title: String
  public var deadline: String
  public var status: Status
  public var icon: String?
  public var createdAt: Temporal.DateTime?
  public var updatedAt: Temporal.DateTime?
  
  public init(id: String = UUID().uuidString,
      title: String,
      deadline: String,
      status: Status,
      icon: String? = nil) {
    self.init(id: id,
      title: title,
      deadline: deadline,
      status: status,
      icon: icon,
      createdAt: nil,
      updatedAt: nil)
  }
  internal init(id: String = UUID().uuidString,
      title: String,
      deadline: String,
      status: Status,
      icon: String? = nil,
      createdAt: Temporal.DateTime? = nil,
      updatedAt: Temporal.DateTime? = nil) {
      self.id = id
      self.title = title
      self.deadline = deadline
      self.status = status
      self.icon = icon
      self.createdAt = createdAt
      self.updatedAt = updatedAt
  }
}