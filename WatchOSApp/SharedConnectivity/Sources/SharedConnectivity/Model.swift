import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let weather = try? newJSONDecoder().decode(Weather.self, from: jsonData)

import Foundation

// MARK: - Weather
public struct Weather: Codable {
    public let coord: Coord?
    public let weather: [WeatherElement]?
    public let base: String?
    public let main: Main?
    public let visibility: Int?
    public let wind: Wind?
    public let clouds: Clouds?
    public let dt: Int?
    public let sys: Sys?
    public let timezone, id: Int?
    public let name: String?
    public let cod: Int?
}

// MARK: - Clouds
public struct Clouds: Codable {
    public let all: Int?
}

// MARK: - Coord
public struct Coord: Codable {
    public let lon, lat: Double?
}

// MARK: - Main
public struct Main: Codable {
    public let temp: Double?
    public let feelsLike: Int?
    public let tempMin, tempMax: Double?
    public let pressure, humidity: Int?

    public enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
    }
}

// MARK: - Sys
public struct Sys: Codable {
    public let type, id: Int?
    public let country: String?
    public let sunrise, sunset: Int?
}

// MARK: - WeatherElement
public struct WeatherElement: Codable {
    public let id: Int?
    public let main, weatherDescription, icon: String?

    public enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

// MARK: - Wind
public struct Wind: Codable {
    public let speed: Double?
    public let deg, gust: Int?
}
