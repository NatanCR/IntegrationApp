// swiftlint:disable all
import Amplify
import Foundation

extension Member {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case name
    case createdAt
    case updatedAt
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let member = Member.keys
    
    model.authRules = [
      rule(allow: .public, operations: [.create, .update, .delete, .read])
    ]
    
    model.listPluralName = "Members"
    model.syncPluralName = "Members"
    
    model.attributes(
      .primaryKey(fields: [member.id])
    )
    
    model.fields(
      .field(member.id, is: .required, ofType: .string),
      .field(member.name, is: .required, ofType: .string),
      .field(member.createdAt, is: .optional, isReadOnly: true, ofType: .dateTime),
      .field(member.updatedAt, is: .optional, isReadOnly: true, ofType: .dateTime)
    )
    }
}

extension Member: ModelIdentifiable {
  public typealias IdentifierFormat = ModelIdentifierFormat.Default
  public typealias IdentifierProtocol = DefaultModelIdentifier<Self>
}