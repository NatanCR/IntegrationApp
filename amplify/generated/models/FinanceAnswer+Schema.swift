// swiftlint:disable all
import Amplify
import Foundation

extension FinanceAnswer {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case title
    case collaborators
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let financeAnswer = FinanceAnswer.keys
    
    model.listPluralName = "FinanceAnswers"
    model.syncPluralName = "FinanceAnswers"
    
    model.fields(
      .field(financeAnswer.id, is: .optional, ofType: .string),
      .field(financeAnswer.title, is: .optional, ofType: .string),
      .field(financeAnswer.collaborators, is: .optional, ofType: .embeddedCollection(of: Member.self))
    )
    }
}