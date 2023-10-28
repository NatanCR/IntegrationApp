// swiftlint:disable all
import Amplify
import Foundation

// Contains the set of classes that conforms to the `Model` protocol. 

final public class AmplifyModels: AmplifyModelRegistration {
  public let version: String = "ca57d0fd4785d786fcafcc793433488b"
  
  public func registerModels(registry: ModelRegistry.Type) {
    ModelRegistry.register(modelType: Event.self)
  }
}