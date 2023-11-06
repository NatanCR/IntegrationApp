// swiftlint:disable all
import Amplify
import Foundation

public struct QuizAnswer: Embeddable {
  var id: String?
  var title: String?
  var votes: Int?
}