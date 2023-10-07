//
//  UIImageView + StateOfImage.swift
//  WeatherApp
//
//  Created by m223 on 06.10.2023.
//

import Foundation
import UIKit

extension UIImageView {
    
    func setWeatherIcon(withCode code: Int?, isDay: Int?) {
        let folderName = isDay == 1 ? "day" : "night"
        if let state = StateOfWeatherEnum(rawValue: code ?? 392) {
            let iconCode = state.iconCode()
            if let image = UIImage(named: "\(folderName)/\(iconCode)") {
                self.image = image
            } else {
                self.image = UIImage(named: "\(folderName)/392") 
            }
        } else {
        }
    }
}
