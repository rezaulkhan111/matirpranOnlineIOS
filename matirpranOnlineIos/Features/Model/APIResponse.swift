import Foundation

struct APIResponse: Codable {
    let status: Bool
    let message: String
    let anyReturnValue: String
}
