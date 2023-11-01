// swiftlint:disable all
import Amplify
import Foundation

public struct QuizAnswer: Model {
  public let id: String
  public var title: String
  public var votes: Int?
  public var createdAt: Temporal.DateTime?
  public var updatedAt: Temporal.DateTime?
  
  public init(id: String = UUID().uuidString,
      title: String,
      votes: Int? = nil) {
    self.init(id: id,
      title: title,
      votes: votes,
      createdAt: nil,
      updatedAt: nil)
  }
  internal init(id: String = UUID().uuidString,
      title: String,
      votes: Int? = nil,
      createdAt: Temporal.DateTime? = nil,
      updatedAt: Temporal.DateTime? = nil) {
      self.id = id
      self.title = title
      self.votes = votes
      self.createdAt = createdAt
      self.updatedAt = updatedAt
  }
}