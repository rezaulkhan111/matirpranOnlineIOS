import SwiftUI

@MainActor
class LoginViewModel: ObservableObject {
    
    @Published var mobileNumber = ""
    @Published var password = ""
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    func login() {
        Task {
            isLoading = true
            errorMessage = nil
            
            do {
                let response = try await APIService.shared.login(
                    mobileNumber: mobileNumber,
                    password: password
                )
                
                SessionManager.shared.saveToken(response.token)
                
            } catch {
                errorMessage = "Login failed"
            }
            
            isLoading = false
        }
    }
}
