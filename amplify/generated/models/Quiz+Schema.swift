// swiftlint:disable all
import Amplify
import Foundation

extension Quiz {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case title
    case category
    case answerType
    case answerOptions
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let quiz = Quiz.keys
    
    model.listPluralName = "Quizzes"
    model.syncPluralName = "Quizzes"
    
    model.fields(
      .field(quiz.id, is: .optional, ofType: .string),
      .field(quiz.title, is: .optional, ofType: .string),
      .field(quiz.category, is: .optional, ofType: .enum(type: QuizCategory.self)),
      .field(quiz.answerType, is: .optional, ofType: .enum(type: AnswerType.self)),
      .field(quiz.answerOptions, is: .optional, ofType: .embeddedCollection(of: QuizAnswer.self))
    )
    }
}