import Foundation

struct WeatherRequest: Codable {
    let units: String
    let appid: String
    let lat: String
    let lon: String
}

struct WeatherResponse: Codable {
    let main: Main
    let dt: Int
    let name: String
}

struct Main: Codable {
    let temp: Double
    let feelsLike: Double
    let tempMin: Double
    let tempMax: Double
    let pressure: Int
    let humidity: Int
    let seaLevel: Int
    let grndLevel: Int
}
