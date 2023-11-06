// swiftlint:disable all
import Amplify
import Foundation

extension QuizAnswer {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case title
    case votes
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let quizAnswer = QuizAnswer.keys
    
    model.listPluralName = "QuizAnswers"
    model.syncPluralName = "QuizAnswers"
    
    model.fields(
      .field(quizAnswer.id, is: .optional, ofType: .string),
      .field(quizAnswer.title, is: .optional, ofType: .string),
      .field(quizAnswer.votes, is: .optional, ofType: .int)
    )
    }
}