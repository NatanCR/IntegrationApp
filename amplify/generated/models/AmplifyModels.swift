// swiftlint:disable all
import Amplify
import Foundation

// Contains the set of classes that conforms to the `Model` protocol. 

final public class AmplifyModels: AmplifyModelRegistration {
  public let version: String = "fe6ddbf07daedc2158fd88df5e8a0df8"
  
  public func registerModels(registry: ModelRegistry.Type) {
    ModelRegistry.register(modelType: Wallet.self)
    ModelRegistry.register(modelType: AllEvents.self)
  }
}