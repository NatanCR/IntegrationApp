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
    case collaborators
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let finance = Finance.keys
    
    model.listPluralName = "Finances"
    model.syncPluralName = "Finances"
    
    model.fields(
      .field(finance.id, is: .optional, ofType: .string),
      .field(finance.title, is: .optional, ofType: .string),
      .field(finance.deadline, is: .optional, ofType: .string),
      .field(finance.totalValue, is: .optional, ofType: .double),
      .field(finance.valueMembers, is: .optional, ofType: .int),
      .field(finance.collaborators, is: .optional, ofType: .embeddedCollection(of: Member.self))
    )
    }
}