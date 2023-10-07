//
//  FormatterDate.swift
//  WeatherApp
//
//  Created by m223 on 06.10.2023.
//

import Foundation
import UIKit

extension UILabel {
    
    
    //MARK: - Time Epoch Formatting
    
    func formatterDateHHmm(timeEpoch: Int?) {
        
        let date = Date(timeIntervalSince1970: TimeInterval(timeEpoch ?? 0))
        
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm"
        
        let timeString = timeFormatter.string(from: date)
        
        self.text = timeString.localized()
        
    }
    
    
    func formatterDateEEEEdMMMM(timeEpoch: Int?) {
        let date = Date(timeIntervalSince1970: TimeInterval(timeEpoch ?? 0))

        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current 
        dateFormatter.setLocalizedDateFormatFromTemplate("EEEE | d MMMM")

        let formattedDate = dateFormatter.string(from: date)

        self.text = formattedDate
    }
    
    func formatterDateEEEEMMMdd() {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE | MMM dd"
        let currentDate = Date()

        let formattedDate = dateFormatter.string(from: currentDate)
        
        self.text = formattedDate.localized()
        
    }
    
    func formatterDateEEEE(from decimalValue: Decimal) {

        let timeInterval = (decimalValue as NSDecimalNumber).doubleValue
        
        let date = Date(timeIntervalSince1970: timeInterval)
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.locale = Locale(identifier: "en_US")
        
        dateFormatter.dateFormat = "EEEE"
        
        let dayOfWeek = dateFormatter.string(from: date)
        
        self.text = dayOfWeek.localized()
    }
    
}
