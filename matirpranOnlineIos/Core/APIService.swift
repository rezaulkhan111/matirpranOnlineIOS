import Foundation

class APIService {
    static let shared = APIService()

    func requestLogin(mobileNumber: String, password: String) async throws
        -> LoginResponse
    {
        guard
            let url = URL(
                string:
                    "https://eapi.ecotechinnovation.com.bd/api/Account/UserLogIn"
            )
        else {
            throw URLError(.badURL)
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let body = LoginRequest(mobileNumber: mobileNumber, password: password)
        request.httpBody = try JSONEncoder().encode(body)

        let (data, response) = try await URLSession.shared.data(for: request)

        if let jsonString = String(data: data, encoding: .utf8) {
            print("RAW JSON:", jsonString)
        }

        guard let httpResponse = response as? HTTPURLResponse,
            httpResponse.statusCode == 200
        else {
            throw URLError(.badServerResponse)
        }

        return try JSONDecoder().decode(LoginResponse.self, from: data)
    }

    func fetchWeather(
        reqWeather: WeatherRequest?
    ) async throws -> WeatherResponse {
        let queryData: [String: String] = [
            "units": reqWeather?.units ?? "",
            "appid": reqWeather?.appid ?? "",
            "lat": reqWeather?.lat ?? "",
            "lon": reqWeather?.lon ?? "",
        ]

        var components = URLComponents(
            string: "https://api.openweathermap.org/data/2.5/weather"
        )

        components?.queryItems = queryData.map {
            URLQueryItem(name: $0.key, value: $0.value)
        }

        guard let url = components?.url else {
            throw URLError(.badURL)
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse,
            httpResponse.statusCode == 200
        else {
            throw URLError(.badServerResponse)
        }

        if let jsonString = String(data: data, encoding: .utf8) {
            print(jsonString)
        }

        return try JSONDecoder().decode(WeatherResponse.self, from: data)
    }
}
