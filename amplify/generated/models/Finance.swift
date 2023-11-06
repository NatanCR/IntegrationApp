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
    
    public init(id: String = UUID().uuidString, title: String? = nil, deadline: String? = nil, totalValue: Double? = nil, valueMembers: Int? = nil, collaborators: [Member?]? = nil) {
        self.id = id
        self.title = title
        self.deadline = deadline
        self.totalValue = totalValue
        self.valueMembers = valueMembers
        self.collaborators = collaborators
    }
}
