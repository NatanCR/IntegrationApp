// swiftlint:disable all
import Amplify
import Foundation

extension Wallet {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case value
    case createdAt
    case updatedAt
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let wallet = Wallet.keys
    
    model.authRules = [
      rule(allow: .public, operations: [.create, .update, .delete, .read])
    ]
    
    model.listPluralName = "Wallets"
    model.syncPluralName = "Wallets"
    
    model.attributes(
      .primaryKey(fields: [wallet.id])
    )
    
    model.fields(
      .field(wallet.id, is: .required, ofType: .string),
      .field(wallet.value, is: .optional, ofType: .double),
      .field(wallet.createdAt, is: .optional, isReadOnly: true, ofType: .dateTime),
      .field(wallet.updatedAt, is: .optional, isReadOnly: true, ofType: .dateTime)
    )
    }
}

extension Wallet: ModelIdentifiable {
  public typealias IdentifierFormat = ModelIdentifierFormat.Default
  public typealias IdentifierProtocol = DefaultModelIdentifier<Self>
}