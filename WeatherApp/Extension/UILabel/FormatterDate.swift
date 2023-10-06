//
//  FormatterDate.swift
//  WeatherApp
//
//  Created by m223 on 06.10.2023.
//

import Foundation
import UIKit

extension UILabel {
    
    func formatterHHDD(timeEpoch: Int?) {
        
        let date = Date(timeIntervalSince1970: TimeInterval(timeEpoch ?? 0))
        
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm"
        
        let timeString = timeFormatter.string(from: date)
        
        self.text = timeString
        
    }
    
    
    func formatterEEEEdMMMM(timeStamp: Int?) {
        
        let date = Date(timeIntervalSince1970: TimeInterval(timeStamp ?? 0))
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.dateFormat = "EEEE | d MMMM"
        
        let formattedDate = dateFormatter.string(from: date)
        
        self.text = formattedDate
        
    }
    
}
