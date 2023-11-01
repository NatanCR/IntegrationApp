// swiftlint:disable all
import Amplify
import Foundation

extension QuizAnswer {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case title
    case votes
    case createdAt
    case updatedAt
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let quizAnswer = QuizAnswer.keys
    
    model.authRules = [
      rule(allow: .public, operations: [.create, .update, .delete, .read])
    ]
    
    model.listPluralName = "QuizAnswers"
    model.syncPluralName = "QuizAnswers"
    
    model.attributes(
      .primaryKey(fields: [quizAnswer.id])
    )
    
    model.fields(
      .field(quizAnswer.id, is: .required, ofType: .string),
      .field(quizAnswer.title, is: .required, ofType: .string),
      .field(quizAnswer.votes, is: .optional, ofType: .int),
      .field(quizAnswer.createdAt, is: .optional, isReadOnly: true, ofType: .dateTime),
      .field(quizAnswer.updatedAt, is: .optional, isReadOnly: true, ofType: .dateTime)
    )
    }
}

extension QuizAnswer: ModelIdentifiable {
  public typealias IdentifierFormat = ModelIdentifierFormat.Default
  public typealias IdentifierProtocol = DefaultModelIdentifier<Self>
}