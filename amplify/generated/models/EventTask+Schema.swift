// swiftlint:disable all
import Amplify
import Foundation

extension EventTask {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case title
    case deadline
    case collaborators
    case status
    case icon
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let eventTask = EventTask.keys
    
    model.listPluralName = "EventTasks"
    model.syncPluralName = "EventTasks"
    
    model.fields(
      .field(eventTask.id, is: .optional, ofType: .string),
      .field(eventTask.title, is: .optional, ofType: .string),
      .field(eventTask.deadline, is: .optional, ofType: .string),
      .field(eventTask.collaborators, is: .optional, ofType: .embeddedCollection(of: Member.self)),
      .field(eventTask.status, is: .optional, ofType: .enum(type: Status.self)),
      .field(eventTask.icon, is: .optional, ofType: .string)
    )
    }
}