// swiftlint:disable all
import Amplify
import Foundation

// Contains the set of classes that conforms to the `Model` protocol. 

final public class AmplifyModels: AmplifyModelRegistration {
  public let version: String = "6c51836cc896eb7b68eb60abeaa6bd75"
  
  public func registerModels(registry: ModelRegistry.Type) {
    ModelRegistry.register(modelType: AllEvents.self)
  }
}