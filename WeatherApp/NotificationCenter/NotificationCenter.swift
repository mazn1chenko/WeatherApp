//
//  NotificationCenter.swift
//  WeatherApp
//
//  Created by m223 on 06.11.2023.
//

import Foundation
import UIKit

final class NotificationCenter {
    
    
    static let shared = NotificationCenter()
    
    func showAlertWith(title: String, message: String, navigationController: UIViewController){
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let OKButtonAlert = UIAlertAction(title: "Ok", style: .default)
        
        alertController.addAction(OKButtonAlert)
        
        navigationController.present(alertController, animated: true)

    }
    
    
    
}
