// swiftlint:disable all
import Amplify
import Foundation

public struct FinanceAnswer: Embeddable {
  var id: String?
  var title: String?
  var collaborators: [Member?]?
}