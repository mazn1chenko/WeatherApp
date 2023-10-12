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
//    let gustMph: Decimal?
//    let gustKph: Decimal?
    

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
//        case gustMph = "gust_mph"
//        case gustKph = "gust_kph"
    }
}

// MARK: - Condition
struct Condition: Codable {
    let text: Text?
    let icon: String?
    let code: Int?
}

enum Text: String, Codable {
    
    case clear = "Clear" // //
    case cloudy = "Cloudy" // //
    case lightDrizzle = "Light drizzle" // //
    case lightRain = "Light rain" // //
    case moderaterain = "Moderate rain" //
    case lightRainShower = "Light rain shower"
    case overcast = "Overcast" // //
    case partlyCloudy = "Partly cloudy" //
    case patchyLightDrizzle = "Patchy light drizzle" //
    case patchyRainPossible = "Patchy rain possible" //
    case sunny = "Sunny" //
    case mist = "Mist" //
    case fog = "Fog"
    
    case мряка = "Мряка"
    case місцямиДощ = "Місцями дощ"
    case місцямиНевеликийДощ = "Місцями невеликий дощ"
    case невеликаХмарність = "Невелика хмарність"
    case невеликаЗлива = "Невелика злива"
    case невеликийДощ = "Невеликий дощ"
    case помірнийДощ = "Помірний дощ"
    case сонячно = "Сонячно"
    case суцільнаХмарність = "Суцільна хмарність"
    case хмарно = "Хмарно"
    case ясно = "Ясно"
    case туман = "Туман"
    
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
    let windDegree: Decimal?
    let pressureMB: Decimal?
    let pressureIn, precipMm, precipIn: Decimal?
    let humidity, cloud: Decimal?
    //let feelslikeC, feelslikeF, windchillC, windchillF: Decimal?
    //let heatindexC, heatindexF, dewpointC, dewpointF: Decimal?
    let willItRain, chanceOfRain, willItSnow, chanceOfSnow: Decimal?
//    let visKM, visMiles: Decimal?
//    let gustMph, gustKph: Decimal?
//    let uv: Decimal?

    enum CodingKeys: String, CodingKey {
        case timeEpoch = "time_epoch"
        case time
        case tempC = "temp_c"
        case tempF = "temp_f"
        case isDay = "is_day"
        case condition
        case windMph = "wind_mph"
        case windKph = "wind_kph"
        case windDegree = "wind_degree"
        case pressureMB = "pressure_mb"
        case pressureIn = "pressure_in"
        case precipMm = "precip_mm"
        case precipIn = "precip_in"
        case humidity, cloud
//        case feelslikeC = "feelslike_c"
//        case feelslikeF = "feelslike_f"
//        case windchillC = "windchill_c"
//        case windchillF = "windchill_f"
//        case heatindexC = "heatindex_c"
//        case heatindexF = "heatindex_f"
//        case dewpointC = "dewpoint_c"
//        case dewpointF = "dewpoint_f"
        case willItRain = "will_it_rain"
        case chanceOfRain = "chance_of_rain"
        case willItSnow = "will_it_snow"
        case chanceOfSnow = "chance_of_snow"
//        case visKM = "vis_km"
//        case visMiles = "vis_miles"
//        case gustMph = "gust_mph"
//        case gustKph = "gust_kph"
//        case uv
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
