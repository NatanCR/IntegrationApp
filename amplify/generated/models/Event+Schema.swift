// swiftlint:disable all
import Amplify
import Foundation

extension Event {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case eventName
    case eventDate
    case activeEvent
    case createdAt
    case updatedAt
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let event = Event.keys
    
    model.authRules = [
      rule(allow: .public, operations: [.create, .update, .delete, .read])
    ]
    
    model.listPluralName = "Events"
    model.syncPluralName = "Events"
    
    model.attributes(
      .primaryKey(fields: [event.id])
    )
    
    model.fields(
      .field(event.id, is: .required, ofType: .string),
      .field(event.eventName, is: .required, ofType: .string),
      .field(event.eventDate, is: .required, ofType: .string),
      .field(event.activeEvent, is: .required, ofType: .bool),
      .field(event.createdAt, is: .optional, isReadOnly: true, ofType: .dateTime),
      .field(event.updatedAt, is: .optional, isReadOnly: true, ofType: .dateTime)
    )
    }
}

extension Event: ModelIdentifiable {
  public typealias IdentifierFormat = ModelIdentifierFormat.Default
  public typealias IdentifierProtocol = DefaultModelIdentifier<Self>
}