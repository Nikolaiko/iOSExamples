import Foundation
import CoreLocation
import SharedConnectivity

class MainScreenViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var latValue: Double = -0.10
    @Published var lngValue: Double = -0.10
    @Published var status: String = "All Ok!"


    private var lastLocation = CLLocationCoordinate2D()
    private let locationManager = CLLocationManager()
    private let apiKey = "2a17dfd539f06e3f8327be22a89e7779"
    private let baseUrl = "https://api.openweathermap.org/data/2.5/weather"

    private var isBusy = false

    override init() {
        super.init()

        if CLLocationManager.locationServicesEnabled() {
            locationManager.requestAlwaysAuthorization()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        } else {
            status = "Location Unavialable"
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }      

        //guard locValue.longitude != lastLocation.longitude || locValue.latitude != locValue.latitude else { return }

        latValue = locValue.latitude
        lngValue = locValue.longitude

        lastLocation = locValue

        requestWeather()
    }

    func requestWeather() {
        guard isBusy == false else { return }
        isBusy = true

        guard let imageURL = URL(string: "\(baseUrl)?lat=\(latValue)&lon=\(lngValue)&appid=\(apiKey)&units=metric") else { fatalError() }
        let request = URLRequest(url: imageURL)

        //print(imageURL.absoluteString)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                self.isBusy = false
                let parsedString = String(data: data, encoding: .utf8)
                ConnectivityManager.shared.send(parsedString ?? "Empty message!")

                //print(parsedString)
            //let weather = try? JSONDecoder().decode(Weather.self, from: data)
                //print(weather)
            } else {
                self.isBusy = false
                print("fail")
            }
        }.resume()
    }

}
