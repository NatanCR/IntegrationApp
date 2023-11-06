// swiftlint:disable all
import Amplify
import Foundation

public struct EventTask: Embeddable {
  var id: String?
  var title: String?
  var deadline: String?
  var collaborators: [Member?]?
  var status: Status?
  var icon: String?
}