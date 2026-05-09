import Foundation

struct HomeService: Codable, Identifiable {
    let id = UUID()
    //    var serviceIcon: Int
    let serviceIcon: String
    //    var serviceUiMessage: Int
    let serviceUiMessage: String
    //    var inputName: Int
    let inputName: String
    let inputDataTypeId: Int? = nil
    let serviceSortName: String
    let serviceType: String
}
