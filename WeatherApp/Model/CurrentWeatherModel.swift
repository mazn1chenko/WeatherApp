//
//  CurrentWeatherModel.swift
//  WeatherApp
//
//  Created by m223 on 05.10.2023.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let currentWeatherModel = try? JSONDecoder().decode(CurrentWeatherModel.self, from: jsonData)

import Foundation

// MARK: - CurrentWeatherModel
struct CurrentWeatherModel: Codable {
    let location: LocationInCurrentLocation?
    let current: CurrentInCurrentLocation?
}

// MARK: - Current
struct CurrentInCurrentLocation: Codable {
    let lastUpdatedEpoch: Decimal?
    let lastUpdated: String?
    let tempC, tempF: Decimal?
    let isDay: Int?
    let condition: ConditionInCurrentLocation?
    let windMph, windKph: Decimal?
//    let windDegree: Decimal?
//    let windDir: String?
    let pressureMB: Decimal?
    let pressureIn: Decimal?
//    precipMm, precipIn: Double?
    let humidity, cloud: Decimal? //string
//    let feelslikeC, feelslikeF: Double? //sting
//    let visKM, visMiles, uv, gustMph: Decimal?
    let gustKph, gustMph: Decimal?

    enum CodingKeys: String, CodingKey {
        case lastUpdatedEpoch = "last_updated_epoch"
        case lastUpdated = "last_updated"
        case tempC = "temp_c"
        case tempF = "temp_f"
        case isDay = "is_day"
        case condition
        case windMph = "wind_mph"
        case windKph = "wind_kph"
//        case windDegree = "wind_degree"
//        case windDir = "wind_dir"
        case pressureMB = "pressure_mb"
        case pressureIn = "pressure_in"
//        case precipMm = "precip_mm"
//        case precipIn = "precip_in"
        case humidity, cloud
//        case feelslikeC = "feelslike_c"
//        case feelslikeF = "feelslike_f"
//        case visKM = "vis_km"
//        case visMiles = "vis_miles"
//        case uv
        case gustMph = "gust_mph"
        case gustKph = "gust_kph"
    }
}

// MARK: - Condition
struct ConditionInCurrentLocation: Codable {
    let text, icon: String?
    let code: Int?
}

// MARK: - Location
struct LocationInCurrentLocation: Codable {
    let name, region, country: String?
//    let lat: Decimal?
//    let lon: Decimal?
//    let tzID: String?
    let localtimeEpoch: Int?
    let localtime: String?

    enum CodingKeys: String, CodingKey {
        case name, region, country
//        lat, lon
//        case tzID = "tz_id"
        case localtimeEpoch = "localtime_epoch"
        case localtime
    }
}

