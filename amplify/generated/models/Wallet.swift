// swiftlint:disable all
import Amplify
import Foundation

public struct Wallet: Embeddable {
  var id: String?
  var value: Double?
    
    public init(id: String = UUID().uuidString, value: Double? = nil) {
        self.id = id
        self.value = value
    }
}
