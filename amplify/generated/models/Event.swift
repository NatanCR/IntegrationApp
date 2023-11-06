// swiftlint:disable all
import Amplify
import Foundation

public struct Event: Embeddable {
  var id: String?
  var eventName: String?
  var eventDate: String?
  var eventMembers: [Member?]?
  var quiz: [Quiz?]?
  var finance: Finance?
  var activeEvent: Bool?
  var task: [EventTask?]?
  var financeValidation: FinanceAnswer?
}