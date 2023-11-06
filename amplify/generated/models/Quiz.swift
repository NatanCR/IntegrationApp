// swiftlint:disable all
import Amplify
import Foundation

public struct Quiz: Embeddable {
  var id: String?
  var title: String?
  var category: QuizCategory?
  var answerType: AnswerType?
  var answerOptions: [QuizAnswer?]?
    
    public init(id: String = UUID().uuidString, title: String? = nil, category: QuizCategory? = nil, answerType: AnswerType? = nil, answerOptions: [QuizAnswer?]? = nil) {
        self.id = id
        self.title = title
        self.category = category
        self.answerType = answerType
        self.answerOptions = answerOptions
    }
}
