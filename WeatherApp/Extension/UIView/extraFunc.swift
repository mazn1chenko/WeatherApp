//
//  UIView + ext.swift
//  WeatherApp
//
//  Created by m223 on 06.11.2023.
//

import Foundation
import UIKit

extension UIView {
    
    
    func add(subviews: UIView...) {
        
        for sub in subviews {
            
            self.addSubview(sub)
        }
        
    }
    
}
