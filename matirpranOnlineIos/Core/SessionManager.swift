import Foundation

class SessionManager {
    static let shared = SessionManager()
    
    private let tokenKey = "user_token"
    
    func saveToken(_ token: String) {
        UserDefaults.standard.set(token, forKey: tokenKey)
    }
    
    func getToken() -> String? {
        UserDefaults.standard.string(forKey: tokenKey)
    }
    
    func logout() {
        UserDefaults.standard.removeObject(forKey: tokenKey)
    }
}
