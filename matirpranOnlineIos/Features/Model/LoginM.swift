
import Foundation

struct LoginRequest: Codable {
    let mobileNumber: String
    let password: String
}

struct LoginResponse: Codable {
    let token: String
    let token_Type: String
    let userId: String
    let firstName: String
    let lastName: String
    let userName: String
    let email: String
    let mobileNumber: String
    let userRoleName: String
    let userRoleId: String
}
