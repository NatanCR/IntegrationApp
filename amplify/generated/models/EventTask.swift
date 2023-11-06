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
    
    public init(id: String = UUID().uuidString, title: String? = nil, deadline: String? = nil, collaborators: [Member?]? = nil, status: Status? = nil, icon: String? = nil) {
        self.id = id
        self.title = title
        self.deadline = deadline
        self.collaborators = collaborators
        self.status = status
        self.icon = icon
    }
}
