//
//  EnumForStateOfWeather.swift
//  WeatherApp
//
//  Created by m223 on 06.10.2023.
//

import Foundation
import UIKit

enum StateOfWeatherEnum: Int {
    
    case sunny = 1000
    case partlyCloudy = 1003
    case cloudy = 1006
    case overcast = 1009
    case mist = 1030
    case patchyRainPossible = 1063
    case patchySnowPossible = 1066
    case patchySleetPossible = 1069
    case patchyFreezingDrizzlePossible = 1072
    case thunderyOutbreaksPossible = 1087
    case blowingSnow = 1114
    case blizzard = 1117
    case fog = 1135
    case freezingFog = 1147
    case patchyLightDrizzle = 1150
    case lightDrizzle = 1153
    case freezingDrizzle = 1168
    case heavyFreezingDrizzle = 1171
    case patchyLightRain = 1180
    case lightRain = 1183
    case moderateRainAtTimes = 1186
    case moderateRain = 1189
    case heavyRainAtTimes = 1192
    case heavyRain = 1195
    case lightFreezingRain = 1198
    case moderateOrHeavyFreezingRain = 1201
    case lightSleet = 1204
    case moderateOrHeavySleet = 1207
    case patchyLightSnow = 1210
    case lightSnow = 1213
    case patchyModerateSnow = 1216
    case moderateSnow = 1219
    case patchyHeavySnow = 1222
    case heavySnow = 1225
    case icePellets = 1237
    case lightRainShower = 1240
    case moderateOrHeavyRainShower = 1243
    case torrentialRainShower = 1246
    case lightSleetShowers = 1249
    case moderateOrHeavySleetShowers = 1252
    case lightSnowShowers = 1255
    case moderateOrHeavySnowShowers = 1258
    case lightShowersOfIcePellets = 1261
    case moderateOrHeavyShowersOfIcePellets = 1264
    case patchyLightRainWithThunder = 1273
    case moderateOrHeavyRainWithThunder = 1276
    case patchyLightSnowWithThunder = 1279
    case moderateOrHeavySnowWithThunder = 1282
    
    // Метод, который возвращает код изображения на основе кода состояния погоды
    func iconCode() -> Int {
        switch self {
        case .sunny: return 113
        case .partlyCloudy: return 116
        case .cloudy: return 119
        case .overcast: return 122
        case .mist: return 143
        case .patchyRainPossible: return 176
        case .patchySnowPossible: return 179
        case .patchySleetPossible: return 182
        case .patchyFreezingDrizzlePossible: return 185
        case .thunderyOutbreaksPossible: return 200
        case .blowingSnow: return 227
        case .blizzard: return 230
        case .fog: return 248
        case .freezingFog: return 260
        case .patchyLightDrizzle: return 263
        case .lightDrizzle: return 266
        case .freezingDrizzle: return 281
        case .heavyFreezingDrizzle: return 284
        case .patchyLightRain: return 293
        case .lightRain: return 296
        case .moderateRainAtTimes: return 299
        case .moderateRain: return 302
        case .heavyRainAtTimes: return 305
        case .heavyRain: return 308
        case .lightFreezingRain: return 311
        case .moderateOrHeavyFreezingRain: return 314
        case .lightSleet: return 317
        case .moderateOrHeavySleet: return 320
        case .patchyLightSnow: return 323
        case .lightSnow: return 326
        case .patchyModerateSnow: return 329
        case .moderateSnow: return 332
        case .patchyHeavySnow: return 335
        case .heavySnow: return 338
        case .icePellets: return 350
        case .lightRainShower: return 353
        case .moderateOrHeavyRainShower: return 356
        case .torrentialRainShower: return 359
        case .lightSleetShowers: return 362
        case .moderateOrHeavySleetShowers: return 365
        case .lightSnowShowers: return 368
        case .moderateOrHeavySnowShowers: return 371
        case .lightShowersOfIcePellets: return 374
        case .moderateOrHeavyShowersOfIcePellets: return 377
        case .patchyLightRainWithThunder: return 386
        case .moderateOrHeavyRainWithThunder: return 389
        case .patchyLightSnowWithThunder: return 392
        case .moderateOrHeavySnowWithThunder: return 395
        }
        
    }
}
