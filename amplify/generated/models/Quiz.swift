// swiftlint:disable all
import Amplify
import Foundation

public struct Quiz: Model {
  public let id: String
  public var title: String
  public var category: QuizCategory
  public var answerType: AnswerType
  public var createdAt: Temporal.DateTime?
  public var updatedAt: Temporal.DateTime?
  
  public init(id: String = UUID().uuidString,
      title: String,
      category: QuizCategory,
      answerType: AnswerType) {
    self.init(id: id,
      title: title,
      category: category,
      answerType: answerType,
      createdAt: nil,
      updatedAt: nil)
  }
  internal init(id: String = UUID().uuidString,
      title: String,
      category: QuizCategory,
      answerType: AnswerType,
      createdAt: Temporal.DateTime? = nil,
      updatedAt: Temporal.DateTime? = nil) {
      self.id = id
      self.title = title
      self.category = category
      self.answerType = answerType
      self.createdAt = createdAt
      self.updatedAt = updatedAt
  }
}