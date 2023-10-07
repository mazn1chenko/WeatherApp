//
//  String.swift
//  WeatherApp
//
//  Created by m223 on 07.10.2023.
//

import Foundation

extension String {
    
    func localized() -> String {
        
        return NSLocalizedString(self,
                                 tableName: "Localizable",
                                 bundle: .main, value: self,
                                 comment: self)
    }
}
