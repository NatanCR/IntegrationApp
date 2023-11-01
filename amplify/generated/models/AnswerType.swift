// swiftlint:disable all
import Amplify
import Foundation

public enum AnswerType: String, EnumPersistable {
  case multiple = "MULTIPLE"
  case unique = "UNIQUE"
}