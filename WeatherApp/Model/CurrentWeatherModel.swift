//
//  CurrentWeatherModel.swift
//  WeatherApp
//
//  Created by m223 on 05.10.2023.
//

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
    let pressureMB: Decimal?
    let pressureIn: Decimal?
    let humidity, cloud: Decimal? //string
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
        case pressureMB = "pressure_mb"
        case pressureIn = "pressure_in"
        case humidity, cloud
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
    let localtimeEpoch: Int?
    let localtime: String?

    enum CodingKeys: String, CodingKey {
        case name, region, country
        case localtimeEpoch = "localtime_epoch"
        case localtime
    }
}

