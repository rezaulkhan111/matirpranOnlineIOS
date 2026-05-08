import SwiftUI

@MainActor
class LoginVM: ObservableObject {

    @Published var mobileNumber = ""
    @Published var password = ""
    @Published var isLoading = false
    @Published var errorMessage: String?

    @Published var weatherResponse: WeatherResponse?
    @Published var failedWeatherResponseLD: APIResponse?

    func requestLogin() {
        Task {
            isLoading = true
            errorMessage = nil

            do {
                let response = try await APIService.shared.requestLogin(
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

    func fetchWeather(reqWeather: WeatherRequest?) {
        Task {
            do {
                let response = try await APIService.shared.fetchWeather(
                    reqWeather: reqWeather
                )

                print(response)

                await MainActor.run {
                    self.weatherResponse = response
                }
            } catch {
                self.failedWeatherResponseLD = APIResponse(
                    status: false,
                    message: "error",
                    anyReturnValue: "any"
                )
            }
        }
    }
}
