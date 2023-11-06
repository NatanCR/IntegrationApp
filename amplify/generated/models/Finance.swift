// swiftlint:disable all
import Amplify
import Foundation

public struct Finance: Embeddable {
  var id: String?
  var title: String?
  var deadline: String?
  var totalValue: Double?
  var valueMembers: Int?
  var collaborators: [Member?]?
}