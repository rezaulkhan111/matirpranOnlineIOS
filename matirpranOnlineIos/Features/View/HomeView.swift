import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = LoginVM()

    var body: some View {
        VStack {
            if let dataWea = viewModel.weatherResponse {
               
                VStack {
                    HStack {
                        Text("Temp \(dataWea.main.temp)°")
                            .font(.system(size: 30))
                            .frame(maxWidth: .infinity, alignment: .leading)

                        VStack(alignment: .trailing, spacing: 8) {
                            Text("Humidity: \(dataWea.main.humidity)%")
                                .font(.system(size: 16))

                            Text("Max: \(dataWea.main.tempMax)°")
                                .font(.system(size: 16))

                            Text("Min: \(dataWea.main.tempMin)°")
                                .font(.system(size: 16))
                        }.frame(maxWidth: .infinity, alignment: .trailing)
                    }

                    HStack {
                        Text("\(dataWea.name)").font(.system(size: 16))
                        Spacer()
                        Text("Updated: 10:30 AM")
                            .font(.system(size: 16))
                        Image(systemName: "arrow.clockwise")
                            .frame(width: 20, height: 20)
                            .onTapGesture {
                                loadWeather()
                            }
                    }.padding(.top, 5)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(15)
                .shadow(radius: 5)
                .padding(5)
            }else{
                Text("Loading...")
            }

            VStack(spacing: 10) {

                Text("Select Your Service")
                    .font(.system(size: 20, weight: .bold))

                LazyVGrid(
                    columns: [
                        GridItem(.flexible()),
                        GridItem(.flexible()),
                    ],
                    spacing: 15
                ) {
                    //                            ServiceButton(imageName: "ic_humidity_icon", title: "PH"){}
                }
            }.padding(.top, 10)

            Spacer()
        }
        .padding()
        .background(Color(.systemGroupedBackground))
        .onAppear {
            loadWeather()
        }
    }

    func loadWeather() {
        viewModel.fetchWeather(
            reqWeather: WeatherRequest(
                units: "metric",
                appid:
                    "c84d678acbbcaae3795c856e22e081f8",
                lat: "23.8103",
                lon: "90.4125"
            )
        )
    }
}
