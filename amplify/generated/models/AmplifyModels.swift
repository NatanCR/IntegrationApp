// swiftlint:disable all
import Amplify
import Foundation

// Contains the set of classes that conforms to the `Model` protocol. 

final public class AmplifyModels: AmplifyModelRegistration {
  public let version: String = "92c982fb634c0a0a1145a920f180d672"
  
  public func registerModels(registry: ModelRegistry.Type) {
    ModelRegistry.register(modelType: Wallet.self)
    ModelRegistry.register(modelType: AllEvents.self)
    ModelRegistry.register(modelType: Event.self)
    ModelRegistry.register(modelType: Member.self)
    ModelRegistry.register(modelType: Quiz.self)
    ModelRegistry.register(modelType: QuizAnswer.self)
    ModelRegistry.register(modelType: Finance.self)
    ModelRegistry.register(modelType: Task.self)
    ModelRegistry.register(modelType: FinanceValidation.self)
    ModelRegistry.register(modelType: FinanceAnswer.self)
  }
}