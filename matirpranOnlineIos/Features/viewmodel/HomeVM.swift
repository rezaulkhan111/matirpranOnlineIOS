import SwiftUI

@MainActor
class HomeVM: ObservableObject {
    @Published var weatherResponse: WeatherResponse?
    @Published var failedWeatherResponseLD: APIResponse?

    @Published var lsHomeServiceLD: [HomeService] = []

    init() {
        getHomeService()
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

    func getHomeService() {
        lsHomeServiceLD = [
            HomeService(
                serviceIcon: "ic_ph_icon",
                serviceUiMessage: "PH Measure",
                inputName: "PH",
                serviceSortName: ServiceInputDT.ph.rawValue,
                serviceType: "MP_Service_PH"
            ),
            HomeService(
                serviceIcon: "ic_humidity_icon",
                serviceUiMessage: "Humidity Measure",
                inputName: "Moisture",
                serviceSortName: ServiceInputDT.moisture.rawValue,
                serviceType: "MP_Service_HUMIDITY"
            ),
            HomeService(
                serviceIcon: "ic_n_p_k_icon",
                serviceUiMessage: "Humidity Measure",
                inputName: "Moisture",
                serviceSortName: "Moisture",
                serviceType: "MP_Service_HUMIDITY"
            ),
            HomeService(
                serviceIcon: "ic_l_c_c_icon",
                serviceUiMessage: "Humidity Measure",
                inputName: "Moisture",
                serviceSortName: ServiceInputDT.lcc.rawValue,
                serviceType: "MP_Service_HUMIDITY"
            ),
            HomeService(
                serviceIcon: "ic_farmer_crop",
                serviceUiMessage: "Humidity Measure",
                inputName: "Moisture",
                serviceSortName: "Moisture",
                serviceType: "MP_Service_HUMIDITY"
            ),
            HomeService(
                serviceIcon: "ic_health_care",
                serviceUiMessage: "Humidity Measure",
                inputName: "Moisture",
                serviceSortName: "Moisture",
                serviceType: "MP_Service_HUMIDITY"
            ),
        ]
    }
}
