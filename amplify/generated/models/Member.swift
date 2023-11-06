// swiftlint:disable all
import Amplify
import Foundation

public struct Member: Embeddable {
  var id: String
  var name: String
  var financeMember: Bool?
    
    public init(id: String = UUID().uuidString, name: String, financeMember: Bool? = nil) {
        self.id = id
        self.name = name
        self.financeMember = financeMember
    }
}
