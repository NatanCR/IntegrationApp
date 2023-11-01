// swiftlint:disable all
import Amplify
import Foundation

extension Finance {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case title
    case deadline
    case totalValue
    case valueMembers
    case createdAt
    case updatedAt
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let finance = Finance.keys
    
    model.authRules = [
      rule(allow: .public, operations: [.create, .update, .delete, .read])
    ]
    
    model.listPluralName = "Finances"
    model.syncPluralName = "Finances"
    
    model.attributes(
      .primaryKey(fields: [finance.id])
    )
    
    model.fields(
      .field(finance.id, is: .required, ofType: .string),
      .field(finance.title, is: .required, ofType: .string),
      .field(finance.deadline, is: .required, ofType: .string),
      .field(finance.totalValue, is: .required, ofType: .double),
      .field(finance.valueMembers, is: .optional, ofType: .int),
      .field(finance.createdAt, is: .optional, isReadOnly: true, ofType: .dateTime),
      .field(finance.updatedAt, is: .optional, isReadOnly: true, ofType: .dateTime)
    )
    }
}

extension Finance: ModelIdentifiable {
  public typealias IdentifierFormat = ModelIdentifierFormat.Default
  public typealias IdentifierProtocol = DefaultModelIdentifier<Self>
}