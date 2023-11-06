// swiftlint:disable all
import Amplify
import Foundation

public struct Member: Embeddable {
  var id: String
  var name: String
  var financeMember: Bool?
}