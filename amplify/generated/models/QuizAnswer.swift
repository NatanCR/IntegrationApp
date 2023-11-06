// swiftlint:disable all
import Amplify
import Foundation

public struct QuizAnswer: Embeddable {
  var id: String?
  var title: String?
  var votes: Int?
    
    public init(id: String = UUID().uuidString, title: String? = nil, votes: Int? = nil) {
        self.id = id
        self.title = title
        self.votes = votes
    }
}
