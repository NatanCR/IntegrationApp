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
  var activeEvent: Bool = true
  var task: [EventTask?]?
  var financeValidation: FinanceAnswer?
    
    public init(id: String = UUID().uuidString, eventName: String? = nil, eventDate: String? = nil, eventMembers: [Member?]? = nil, quiz: [Quiz?]? = nil, finance: Finance? = nil, task: [EventTask?]? = nil, financeValidation: FinanceAnswer? = nil) {
        self.id = id
        self.eventName = eventName
        self.eventDate = eventDate
        self.eventMembers = eventMembers
        self.quiz = quiz
        self.finance = finance
        self.task = task
        self.financeValidation = financeValidation
    }
}
