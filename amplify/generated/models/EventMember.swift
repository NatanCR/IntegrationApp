// swiftlint:disable all
import Amplify
import Foundation

public struct EventMember: Embeddable {
    var id: String
    var name: String
    
    init(id: String = UUID().uuidString, name: String) {
        self.id = id
        self.name = name
    }
}
