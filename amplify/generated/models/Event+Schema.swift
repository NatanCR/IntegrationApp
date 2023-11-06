// swiftlint:disable all
import Amplify
import Foundation

extension Event {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case eventName
    case eventDate
    case eventMembers
    case quiz
    case finance
    case activeEvent
    case task
    case financeValidation
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let event = Event.keys
    
    model.listPluralName = "Events"
    model.syncPluralName = "Events"
    
    model.fields(
      .field(event.id, is: .optional, ofType: .string),
      .field(event.eventName, is: .optional, ofType: .string),
      .field(event.eventDate, is: .optional, ofType: .string),
      .field(event.eventMembers, is: .optional, ofType: .embeddedCollection(of: Member.self)),
      .field(event.quiz, is: .optional, ofType: .embeddedCollection(of: Quiz.self)),
      .field(event.finance, is: .optional, ofType: .embedded(type: Finance.self)),
      .field(event.activeEvent, is: .optional, ofType: .bool),
      .field(event.task, is: .optional, ofType: .embeddedCollection(of: EventTask.self)),
      .field(event.financeValidation, is: .optional, ofType: .embedded(type: FinanceAnswer.self))
    )
    }
}