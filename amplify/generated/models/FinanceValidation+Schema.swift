// swiftlint:disable all
import Amplify
import Foundation

extension FinanceValidation {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case createdAt
    case updatedAt
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let financeValidation = FinanceValidation.keys
    
    model.authRules = [
      rule(allow: .public, operations: [.create, .update, .delete, .read])
    ]
    
    model.listPluralName = "FinanceValidations"
    model.syncPluralName = "FinanceValidations"
    
    model.attributes(
      .primaryKey(fields: [financeValidation.id])
    )
    
    model.fields(
      .field(financeValidation.id, is: .required, ofType: .string),
      .field(financeValidation.createdAt, is: .optional, isReadOnly: true, ofType: .dateTime),
      .field(financeValidation.updatedAt, is: .optional, isReadOnly: true, ofType: .dateTime)
    )
    }
}

extension FinanceValidation: ModelIdentifiable {
  public typealias IdentifierFormat = ModelIdentifierFormat.Default
  public typealias IdentifierProtocol = DefaultModelIdentifier<Self>
}