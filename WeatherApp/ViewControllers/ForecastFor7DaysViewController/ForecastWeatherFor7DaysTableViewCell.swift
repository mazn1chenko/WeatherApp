//
//  ForecastWeatherFor7DaysTableViewCell.swift
//  WeatherApp
//
//  Created by m223 on 07.10.2023.
//

import Foundation
import UIKit


class ForecastWeatherFor7DaysTableViewCell: UITableViewCell {
    
    static let cellId = "ForecastWeatherFor7DaysTableViewCell"
    
    private let nameOfDayLabel = UILabel()
    private let stateOfWeatherImage = UIImageView()
    private let chanceOfRainLabel = UILabel()
    private let minMaxTemperatureLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .backgroundOfView
        setupViews()
        setupLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Functions setupViews and setupLayouts
    
    //MARK:  setupViews
    
    private func setupViews() {
        
        nameOfDayLabel.translatesAutoresizingMaskIntoConstraints = false
        nameOfDayLabel.text = "Day"
        nameOfDayLabel.font = UIFont(name: "Poppins-Medium", size: 16)
        
        stateOfWeatherImage.translatesAutoresizingMaskIntoConstraints = false
        
        chanceOfRainLabel.translatesAutoresizingMaskIntoConstraints = false
        chanceOfRainLabel.text = "18% rain"
        chanceOfRainLabel.font = UIFont(name: "Poppins-Regular", size: 16)
        
        minMaxTemperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        minMaxTemperatureLabel.text = "18/15°"
        minMaxTemperatureLabel.font = UIFont(name: "Poppins-Regular", size: 16)
        
    }
    
    //MARK: setupLayouts
    
    private func setupLayouts() {
        addSubview(nameOfDayLabel)
        addSubview(stateOfWeatherImage)
        addSubview(chanceOfRainLabel)
        addSubview(minMaxTemperatureLabel)
        
        NSLayoutConstraint.activate([
            
            nameOfDayLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            nameOfDayLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            stateOfWeatherImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            stateOfWeatherImage.trailingAnchor.constraint(equalTo: centerXAnchor),
            
            chanceOfRainLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            chanceOfRainLabel.leadingAnchor.constraint(equalTo: centerXAnchor),
            
            minMaxTemperatureLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            minMaxTemperatureLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
            
            
        ])
        
    }
    //MARK: - Configure cell
    
    func configureCell(model: Forecastday) {
        
        nameOfDayLabel.formatterDateEEEE(from: Decimal(model.dateEpoch ?? 00))
        
        chanceOfRainLabel.text = "\(model.day?.dailyChanceOfRain ?? -0)% \(("rain").localized())"
        
        stateOfWeatherImage.setWeatherIcon(withCode: model.day?.condition?.code, isDay: 1)
        
        
        if let selectedSegmentIndex = UserDefaults.standard.value(forKey: "selectedTempUnitIndex") as? Int {
            if selectedSegmentIndex == 0 {

                minMaxTemperatureLabel.text =
                "\(Int(truncating: NSDecimalNumber(decimal: model.day?.mintempC ?? -0)))°/\(Int(truncating:NSDecimalNumber(decimal: model.day?.maxtempC ?? -0)))°"

            } else {

                minMaxTemperatureLabel.text =
                "\(Int(truncating: NSDecimalNumber(decimal: model.day?.maxtempF ?? -0)))°/\(Int(truncating:NSDecimalNumber(decimal: model.day?.maxtempF ?? -0)))°"
            }
        }
    }
}
