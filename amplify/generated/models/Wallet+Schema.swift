// swiftlint:disable all
import Amplify
import Foundation

extension Wallet {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case value
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let wallet = Wallet.keys
    
    model.listPluralName = "Wallets"
    model.syncPluralName = "Wallets"
    
    model.fields(
      .field(wallet.id, is: .optional, ofType: .string),
      .field(wallet.value, is: .optional, ofType: .double)
    )
    }
}