// swiftlint:disable all
import Amplify
import Foundation

extension FinanceAnswer {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case title
    case createdAt
    case updatedAt
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let financeAnswer = FinanceAnswer.keys
    
    model.authRules = [
      rule(allow: .public, operations: [.create, .update, .delete, .read])
    ]
    
    model.listPluralName = "FinanceAnswers"
    model.syncPluralName = "FinanceAnswers"
    
    model.attributes(
      .primaryKey(fields: [financeAnswer.id])
    )
    
    model.fields(
      .field(financeAnswer.id, is: .required, ofType: .string),
      .field(financeAnswer.title, is: .required, ofType: .string),
      .field(financeAnswer.createdAt, is: .optional, isReadOnly: true, ofType: .dateTime),
      .field(financeAnswer.updatedAt, is: .optional, isReadOnly: true, ofType: .dateTime)
    )
    }
}

extension FinanceAnswer: ModelIdentifiable {
  public typealias IdentifierFormat = ModelIdentifierFormat.Default
  public typealias IdentifierProtocol = DefaultModelIdentifier<Self>
}