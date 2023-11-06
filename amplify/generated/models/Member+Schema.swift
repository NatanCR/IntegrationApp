// swiftlint:disable all
import Amplify
import Foundation

extension Member {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case name
    case financeMember
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let member = Member.keys
    
    model.listPluralName = "Members"
    model.syncPluralName = "Members"
    
    model.fields(
      .field(member.id, is: .required, ofType: .string),
      .field(member.name, is: .required, ofType: .string),
      .field(member.financeMember, is: .optional, ofType: .bool)
    )
    }
}