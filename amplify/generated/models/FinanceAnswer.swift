// swiftlint:disable all
import Amplify
import Foundation

public struct FinanceAnswer: Embeddable {
  var id: String?
  var title: String?
  var collaborators: [Member?]?
    
    public init(id: String = UUID().uuidString, title: String? = nil, collaborators: [Member?]? = nil) {
        self.id = id
        self.title = title
        self.collaborators = collaborators
    }
}
