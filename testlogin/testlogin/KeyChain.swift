import Foundation
import KeychainSwift

enum KeyChainItem : String {
    case token = "token"
    case email = "email"
}

class KeychainManager {
    static let shared: KeychainManager = {
        let instance = KeychainManager()

        return instance
    }()
    let keychain = KeychainSwift()
    func setToken(_ token: String) {
        keychain.set(token, forKey: KeyChainItem.token.rawValue)
    }

    func getToken() -> String? {
        return keychain.get(KeyChainItem.token.rawValue)
    }
    
    func saveString(value: String, forkey key: KeyChainItem) {
        keychain.set(value, forKey: key.rawValue)
    }
    
    func getString(key: KeyChainItem) -> String? {
        return keychain.get(key.rawValue)
    }
}
