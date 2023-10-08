//
//  ForecastWeatherCollectionViewCell.swift
//  WeatherApp
//
//  Created by m223 on 05.10.2023.
//

import UIKit

final class ForecastWeatherCollectionViewCell: UICollectionViewCell {
    
    static let cellId = "ForecastWeatherCollectionViewCell"
    
    private let timeOfWeatherLabel = UILabel()
    
    private let stateOfWeatherImageView = UIImageView()
    
    private let temperatureOfWeatherLabel = UILabel()
    
    private let chanceOfRainLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupLayouts()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    //MARK: - Functions setupViews and setupLayouts

    //MARK: setupViews

    private func setupViews() {
        
        timeOfWeatherLabel.translatesAutoresizingMaskIntoConstraints = false
        timeOfWeatherLabel.text = "Now"
        timeOfWeatherLabel.font = UIFont(name: "Poppins-Medium", size: 18)
        timeOfWeatherLabel.textAlignment = .center
        
        stateOfWeatherImageView.translatesAutoresizingMaskIntoConstraints = false
        stateOfWeatherImageView.image = UIImage(named: "rain 1")
        
        temperatureOfWeatherLabel.translatesAutoresizingMaskIntoConstraints = false
        temperatureOfWeatherLabel.text = "20°/24°"
        temperatureOfWeatherLabel.font = UIFont(name: "Poppins-Regular", size: 18)
        temperatureOfWeatherLabel.textAlignment = .center

        
        chanceOfRainLabel.translatesAutoresizingMaskIntoConstraints = false
        chanceOfRainLabel.text = "27% rain"
        chanceOfRainLabel.font = UIFont(name: "Poppins-Regular", size: 18)
        chanceOfRainLabel.textAlignment = .center

    }
    
    //MARK: setupLayouts

    private func setupLayouts() {
        addSubview(timeOfWeatherLabel)
        addSubview(stateOfWeatherImageView)
        addSubview(temperatureOfWeatherLabel)
        addSubview(chanceOfRainLabel)
        
        NSLayoutConstraint.activate([
            
            timeOfWeatherLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            timeOfWeatherLabel.topAnchor.constraint(equalTo: topAnchor, constant: 1),
            
            stateOfWeatherImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stateOfWeatherImageView.topAnchor.constraint(equalTo: timeOfWeatherLabel.bottomAnchor, constant: 1),
            
            temperatureOfWeatherLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            temperatureOfWeatherLabel.topAnchor.constraint(equalTo: stateOfWeatherImageView.bottomAnchor, constant: 1),
            
            chanceOfRainLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -1),
            chanceOfRainLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
            
        ])
    }
    
    //MARK: - Configure cell

    func configureCell(index: Hour) {
        
        temperatureOfWeatherLabel.text = "\(Int(NSDecimalNumber(decimal: index.tempC ?? -0).doubleValue))°"
                        
        timeOfWeatherLabel.formatterDateHHmm(timeEpoch: index.timeEpoch)
        
        
        chanceOfRainLabel.text = "\(index.chanceOfRain ?? 0)% \("rain".localized())"
        
        stateOfWeatherImageView.setWeatherIcon(withCode: index.condition?.code, isDay: index.isDay)
        
        
    }
    
}
