//
//  ForecastWeatherModel.swift
//  WeatherApp
//
//  Created by m223 on 05.10.2023.
//
import Foundation

// MARK: - ForecastWeatherModel
struct ForecastWeatherModel: Codable {
    let location: Location?
    let current: Current?
    let forecast: Forecast?
}

// MARK: - Current
struct Current: Codable {
    let lastUpdatedEpoch: Int?
    let lastUpdated: String?
    let tempC, tempF: Decimal?
    let isDay: Int?
    let condition: Condition?
    let windMph, windKph: Decimal?
    let pressureMB: Decimal?
    let humidity: Decimal?
    let cloud: Decimal?
    let gustMph: Decimal?
    let gustKph: Decimal?
    
    

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
        case humidity, cloud
        case gustMph = "gust_mph"
        case gustKph = "gust_kph"
    }
}

// MARK: - Condition
struct Condition: Codable {
    let text: Text?
    let icon: String?
    let code: Int?
}

enum Text: String, Codable {
    
    case clear = "Clear"
    case cloudy = "Cloudy"
    case lightDrizzle = "Light drizzle"
    case lightRain = "Light rain"
    case moderateRain = "Moderate rain"
    case overcast = "Overcast"
    case partlyCloudy = "Partly cloudy"
    case patchyLightDrizzle = "Patchy light drizzle"
    case patchyRainPossible = "Patchy rain possible"
    case sunny = "Sunny"
    case lightRainShower = "Light rain shower"


    case мряка = "Мряка"
    case місцямиДощ = "Місцями дощ"
    case місцямиНевеликийДощ = "Місцями невеликий дощ"
    case невеликаХмарність = "Невелика хмарність"
    case невеликийДощ = "Невеликий дощ"
    case помірнийДощ = "Помірний дощ"
    case сонячно = "Сонячно"
    case суцільнаХмарність = "Суцільна хмарність"
    case хмарно = "Хмарно"
    case ясно = "Ясно"
}

//enum WindDir: String, Codable {
//    case nnw = "NNW"
//    case nw = "NW"
//    case s = "S"
//    case ssw = "SSW"
//    case sw = "SW"
//    case w = "W"
//    case wnw = "WNW"
//    case wsw = "WSW"
//}

// MARK: - Forecast
struct Forecast: Codable {
    let forecastday: [Forecastday]?
}

// MARK: - Forecastday
struct Forecastday: Codable {
    let date: String?
    let dateEpoch: Int?
    let day: Day?
    let hour: [Hour]?

    enum CodingKeys: String, CodingKey {
        case date
        case dateEpoch = "date_epoch"
        case day
        case hour
    }
}


// MARK: - Day
struct Day: Codable {
    let maxtempC, maxtempF, mintempC, mintempF: Decimal?
    let dailyChanceOfRain: Decimal?
    let condition: Condition?

    enum CodingKeys: String, CodingKey {
        case maxtempC = "maxtemp_c"
        case maxtempF = "maxtemp_f"
        case mintempC = "mintemp_c"
        case mintempF = "mintemp_f"
        case dailyChanceOfRain = "daily_chance_of_rain"
        case condition
    }
}

// MARK: - Hour
struct Hour: Codable {
    let timeEpoch: Int?
    let time: String?
    let tempC, tempF: Decimal?
    let isDay: Int?
    let condition: Condition?
    let windMph, windKph: Decimal?
    let pressureMB: Decimal?
    let humidity, cloud: Decimal?
    let chanceOfRain: Decimal?
    let gustMph, gustKph: Decimal?

    enum CodingKeys: String, CodingKey {
        case timeEpoch = "time_epoch"
        case time
        case tempC = "temp_c"
        case tempF = "temp_f"
        case isDay = "is_day"
        case condition
        case windMph = "wind_mph"
        case windKph = "wind_kph"
        case pressureMB = "pressure_mb"
        case humidity, cloud
        case chanceOfRain = "chance_of_rain"
        case gustMph = "gust_mph"
        case gustKph = "gust_kph"
    }
}

// MARK: - Location
struct Location: Codable {
    let name, region, country: String?
    let localtimeEpoch: Int?
    let localtime: String?

    enum CodingKeys: String, CodingKey {
        case name, region, country
        case localtimeEpoch = "localtime_epoch"
        case localtime
    }
}
