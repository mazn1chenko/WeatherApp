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
    let lastUpdatedEpoch: Int? // int
    let lastUpdated: String? //
    let tempC, tempF: Decimal? //
    let isDay: Int? //
    let condition: Condition? //
    let windMph, windKph: Decimal? //
//    let windDegree: Decimal? // int
//    let windDir: WindDir? //
    let pressureMB: Decimal? //
//    let pressureIn, precipMm, precipIn: Decimal? //
    let humidity: Decimal? // int
    let cloud: Decimal? // int
//    let feelslikeC, feelslikeF: Decimal? //
//    let visKM, visMiles, uv
    let gustMph: Decimal? //
    let gustKph: Decimal? //
    
    

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
//        case pressureIn = "pressure_in"
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
//    let astro: Astro?
    let hour: [Hour]?

    enum CodingKeys: String, CodingKey {
        case date
        case dateEpoch = "date_epoch"
        case day
//        case astro
        case hour
    }
}

// MARK: - Astro
//struct Astro: Codable {
//    let sunrise, sunset, moonrise, moonset: String?
//    let moonPhase, moonIllumination: String?
//    let isMoonUp, isSunUp: Decimal?
//
//    enum CodingKeys: String, CodingKey {
//        case sunrise, sunset, moonrise, moonset
//        case moonPhase = "moon_phase"
//        case moonIllumination = "moon_illumination"
//        case isMoonUp = "is_moon_up"
//        case isSunUp = "is_sun_up"
//    }
//}

// MARK: - Day
struct Day: Codable {
    let maxtempC, maxtempF, mintempC, mintempF: Decimal?
//    let avgtempC, avgtempF, maxwindMph, maxwindKph: Decimal?
//    let totalprecipMm, totalprecipIn: Decimal?
//    let totalsnowCM: Decimal?
//    let avgvisKM: Decimal?
//    let avgvisMiles, avghumidity: Decimal?
//    let dailyWillItRain,
    let dailyChanceOfRain: Decimal?
//    let dailyWillItSnow, dailyChanceOfSnow: Decimal?
    let condition: Condition?
//    let uv: Decimal?

    enum CodingKeys: String, CodingKey {
        case maxtempC = "maxtemp_c"
        case maxtempF = "maxtemp_f"
        case mintempC = "mintemp_c"
        case mintempF = "mintemp_f"
//        case avgtempC = "avgtemp_c"
//        case avgtempF = "avgtemp_f"
//        case maxwindMph = "maxwind_mph"
//        case maxwindKph = "maxwind_kph"
//        case totalprecipMm = "totalprecip_mm"
//        case totalprecipIn = "totalprecip_in"
//        case totalsnowCM = "totalsnow_cm"
//        case avgvisKM = "avgvis_km"
//        case avgvisMiles = "avgvis_miles"
//        case avghumidity
//        case dailyWillItRain = "daily_will_it_rain"
        case dailyChanceOfRain = "daily_chance_of_rain"
//        case dailyWillItSnow = "daily_will_it_snow"
//        case dailyChanceOfSnow = "daily_chance_of_snow"
        case condition
//        case uv
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
//    let windDegree: Decimal?
//    let windDir: WindDir?
    let pressureMB: Decimal?
//    let pressureIn, precipMm, precipIn: Decimal?
    let humidity, cloud: Decimal?
//    let feelslikeC, feelslikeF, windchillC, windchillF: Decimal?
//    let heatindexC, heatindexF, dewpointC, dewpointF: Decimal?
    let chanceOfRain: Decimal?
//    let willItRain, willItSnow, chanceOfSnow: Decimal?
//    let visKM, visMiles: Decimal?
    let gustMph, gustKph: Decimal?
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
//        case windDegree = "wind_degree"
//        case windDir = "wind_dir"
        case pressureMB = "pressure_mb"
//        case pressureIn = "pressure_in"
//        case precipMm = "precip_mm"
//        case precipIn = "precip_in"
        case humidity, cloud
//        case feelslikeC = "feelslike_c"
//        case feelslikeF = "feelslike_f"
//        case windchillC = "windchill_c"
//        case windchillF = "windchill_f"
//        case heatindexC = "heatindex_c"
//        case heatindexF = "heatindex_f"
//        case dewpointC = "dewpoint_c"
//        case dewpointF = "dewpoint_f"
//        case willItRain = "will_it_rain"
        case chanceOfRain = "chance_of_rain"
//        case willItSnow = "will_it_snow"
//        case chanceOfSnow = "chance_of_snow"
//        case visKM = "vis_km"
//        case visMiles = "vis_miles"
        case gustMph = "gust_mph"
        case gustKph = "gust_kph"
//        case uv
    }
}

// MARK: - Location
struct Location: Codable {
    let name, region, country: String?
//    let lat: Decimal?
//    let lon: Decimal?
//    let tzID: String?
    let localtimeEpoch: Int?
    let localtime: String?

    enum CodingKeys: String, CodingKey {
        case name, region, country
//             lat, lon
//        case tzID = "tz_id"
        case localtimeEpoch = "localtime_epoch"
        case localtime
    }
}
