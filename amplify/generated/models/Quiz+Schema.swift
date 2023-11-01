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
    case createdAt
    case updatedAt
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let quiz = Quiz.keys
    
    model.authRules = [
      rule(allow: .public, operations: [.create, .update, .delete, .read])
    ]
    
    model.listPluralName = "Quizzes"
    model.syncPluralName = "Quizzes"
    
    model.attributes(
      .primaryKey(fields: [quiz.id])
    )
    
    model.fields(
      .field(quiz.id, is: .required, ofType: .string),
      .field(quiz.title, is: .required, ofType: .string),
      .field(quiz.category, is: .required, ofType: .enum(type: QuizCategory.self)),
      .field(quiz.answerType, is: .required, ofType: .enum(type: AnswerType.self)),
      .field(quiz.createdAt, is: .optional, isReadOnly: true, ofType: .dateTime),
      .field(quiz.updatedAt, is: .optional, isReadOnly: true, ofType: .dateTime)
    )
    }
}

extension Quiz: ModelIdentifiable {
  public typealias IdentifierFormat = ModelIdentifierFormat.Default
  public typealias IdentifierProtocol = DefaultModelIdentifier<Self>
}