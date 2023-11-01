// swiftlint:disable all
import Amplify
import Foundation

public struct Finance: Model {
  public let id: String
  public var title: String
  public var deadline: String
  public var totalValue: Double
  public var valueMembers: Int?
  public var createdAt: Temporal.DateTime?
  public var updatedAt: Temporal.DateTime?
  
  public init(id: String = UUID().uuidString,
      title: String,
      deadline: String,
      totalValue: Double,
      valueMembers: Int? = nil) {
    self.init(id: id,
      title: title,
      deadline: deadline,
      totalValue: totalValue,
      valueMembers: valueMembers,
      createdAt: nil,
      updatedAt: nil)
  }
  internal init(id: String = UUID().uuidString,
      title: String,
      deadline: String,
      totalValue: Double,
      valueMembers: Int? = nil,
      createdAt: Temporal.DateTime? = nil,
      updatedAt: Temporal.DateTime? = nil) {
      self.id = id
      self.title = title
      self.deadline = deadline
      self.totalValue = totalValue
      self.valueMembers = valueMembers
      self.createdAt = createdAt
      self.updatedAt = updatedAt
  }
}