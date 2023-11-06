// swiftlint:disable all
import Amplify
import Foundation

public struct Quiz: Embeddable {
  var id: String?
  var title: String?
  var category: QuizCategory?
  var answerType: AnswerType?
  var answerOptions: [QuizAnswer?]?
}