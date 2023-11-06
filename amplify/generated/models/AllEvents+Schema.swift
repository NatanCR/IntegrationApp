// swiftlint:disable all
import Amplify
import Foundation

extension AllEvents {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case currentEvent
    case previousEvent
    case wallet
    case createdAt
    case updatedAt
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let allEvents = AllEvents.keys
    
    model.authRules = [
      rule(allow: .public, operations: [.create, .update, .delete, .read])
    ]
    
    model.listPluralName = "AllEvents"
    model.syncPluralName = "AllEvents"
    
    model.attributes(
      .primaryKey(fields: [allEvents.id])
    )
    
    model.fields(
      .field(allEvents.id, is: .required, ofType: .string),
      .field(allEvents.currentEvent, is: .optional, ofType: .embedded(type: Event.self)),
      .field(allEvents.previousEvent, is: .optional, ofType: .embeddedCollection(of: Event.self)),
      .field(allEvents.wallet, is: .optional, ofType: .embedded(type: Wallet.self)),
      .field(allEvents.createdAt, is: .optional, isReadOnly: true, ofType: .dateTime),
      .field(allEvents.updatedAt, is: .optional, isReadOnly: true, ofType: .dateTime)
    )
    }
}

extension AllEvents: ModelIdentifiable {
  public typealias IdentifierFormat = ModelIdentifierFormat.Default
  public typealias IdentifierProtocol = DefaultModelIdentifier<Self>
}