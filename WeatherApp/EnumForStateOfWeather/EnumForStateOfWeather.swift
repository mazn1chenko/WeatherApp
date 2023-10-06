//
//  EnumForStateOfWeather.swift
//  WeatherApp
//
//  Created by m223 on 06.10.2023.
//

import Foundation
import UIKit

enum StateOfWeatherEnum: Int {
    
    case clearSky = 1000
    case partlyCloudy = 1003
    case cloudy = 1006
    case mist = 113
    case fog = 116
    case smoke = 119
    case overcast = 122
    case lightRain = 143
    case moderateRain = 176
    case heavyRain = 179
    case lightSnow = 182
    case moderateSnow = 185
    case heavySnow = 200
    case sleet = 227
    case lightShowerSleet = 230
    case lightRainShowers = 248
    case moderateRainShowers = 260
    case heavyRainShowers = 263
    case lightSnowShowers = 266
    case moderateSnowShowers = 281
    case heavySnowShowers = 284
    case lightSleetShowers = 293
    case moderateSleetShowers = 296
    case heavySleetShowers = 299
    case thunderstorm = 302
    case thunderstormWithRain = 305
    case thunderstormWithHeavyRain = 308
    case thunderstormWithLightSleet = 311
    case thunderstormWithSleet = 314
    case thunderstormWithLightSnow = 317
    case thunderstormWithModerateSnow = 320
    case thunderstormWithHeavySnow = 323
    case thunderstormWithLightSleetShowers = 326
    case thunderstormWithSleetShowers = 329
    case thunderstormWithLightSnowShowers = 332
    case thunderstormWithModerateSnowShowers = 335
    case thunderstormWithHeavySnowShowers = 338
    case freezingFog = 350
    case na = 353
    case freezingRain = 356
    case heavyFreezingRain = 359
    case lightDrizzle = 362
    case drizzle = 365
    case heavyDrizzle = 368
    case lightFreezingRain = 371
    case freezingRainShowers = 374
    case heavyFreezingRainShowers = 377
    case lightSleet = 386
    case sleetShowers = 389
   // case lightSnow = 392
    case snowShowers = 395
    
    // Метод, который возвращает код изображения на основе кода состояния погоды
    func iconCode() -> Int {
        switch self {
        case .clearSky: return 113
        case .partlyCloudy: return 116
        case .cloudy: return 119
        case .mist: return 113
        case .fog: return 116
        case .smoke: return 119
        case .overcast: return 122
        case .lightRain: return 143
        case .moderateRain: return 176
        case .heavyRain: return 179
        case .lightSnow: return 182
        case .moderateSnow: return 185
        case .heavySnow: return 200
        case .sleet: return 227
        case .lightShowerSleet: return 230
        case .lightRainShowers: return 248
        case .moderateRainShowers: return 260
        case .heavyRainShowers: return 263
        case .lightSnowShowers: return 266
        case .moderateSnowShowers: return 281
        case .heavySnowShowers: return 284
        case .lightSleetShowers: return 293
        case .moderateSleetShowers: return 296
        case .heavySleetShowers: return 299
        case .thunderstorm: return 302
        case .thunderstormWithRain: return 305
        case .thunderstormWithHeavyRain: return 308
        case .thunderstormWithLightSleet: return 311
        case .thunderstormWithSleet: return 314
        case .thunderstormWithLightSnow: return 317
        case .thunderstormWithModerateSnow: return 320
        case .thunderstormWithHeavySnow: return 323
        case .thunderstormWithLightSleetShowers: return 326
        case .thunderstormWithSleetShowers: return 329
        case .thunderstormWithLightSnowShowers: return 332
        case .thunderstormWithModerateSnowShowers: return 335
        case .thunderstormWithHeavySnowShowers: return 338
        case .freezingFog: return 350
        case .na: return 353
        case .freezingRain: return 356
        case .heavyFreezingRain: return 359
        case .lightDrizzle: return 362
        case .drizzle: return 365
        case .heavyDrizzle: return 368
        case .lightFreezingRain: return 371
        case .freezingRainShowers: return 374
        case .heavyFreezingRainShowers: return 377
        case .lightSleet: return 386
        case .sleetShowers: return 389
        //case .lightSnow: return 392
        case .snowShowers: return 395
        }
    }
}
