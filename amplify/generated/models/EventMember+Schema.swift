// swiftlint:disable all
import Amplify
import Foundation

extension EventMember {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case name
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let eventMember = EventMember.keys
    
    model.listPluralName = "EventMembers"
    model.syncPluralName = "EventMembers"
    
    model.fields(
      .field(eventMember.id, is: .required, ofType: .string),
      .field(eventMember.name, is: .required, ofType: .string)
    )
    }
}