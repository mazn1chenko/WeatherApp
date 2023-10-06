//
//  ForecastWeatherCollectionViewCell.swift
//  WeatherApp
//
//  Created by m223 on 05.10.2023.
//

import UIKit

class ForecastWeatherCollectionViewCell: UICollectionViewCell {
    
    static let cellId = "ForecastWeatherCollectionViewCell"
    
    let timeOfWeatherLabel = UILabel()
    
    let stateOfWeatherImageView = UIImageView()
    
    let temperatureOfWeatherLabel = UILabel()
    
    let chanceOfRainLabel = UILabel()
    
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
        
        stateOfWeatherImageView.translatesAutoresizingMaskIntoConstraints = false
        stateOfWeatherImageView.image = UIImage(named: "rain 1")
        
        temperatureOfWeatherLabel.translatesAutoresizingMaskIntoConstraints = false
        temperatureOfWeatherLabel.text = "20°/24°"
        temperatureOfWeatherLabel.font = UIFont(name: "Poppins-Regular", size: 18)
        
        
        
    }
    
    //MARK: setupLayouts

    private func setupLayouts() {
        addSubview(timeOfWeatherLabel)
        addSubview(stateOfWeatherImageView)
        addSubview(temperatureOfWeatherLabel)
        
        NSLayoutConstraint.activate([
            
            timeOfWeatherLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            timeOfWeatherLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            
            stateOfWeatherImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stateOfWeatherImageView.topAnchor.constraint(equalTo: timeOfWeatherLabel.bottomAnchor, constant: 5),
            
            temperatureOfWeatherLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            temperatureOfWeatherLabel.topAnchor.constraint(equalTo: stateOfWeatherImageView.bottomAnchor, constant: 5)
            
            
            
        ])
    }
    
    //MARK: - configurateCell

    func configureCell(index: Hour) {
        
        temperatureOfWeatherLabel.text = "\(Int(index.tempC ?? 000.0))°"
                
        timeOfWeatherLabel.formatterHHDD(timeEpoch: index.timeEpoch)
        
        stateOfWeatherImageView.setWeatherIcon(withCode: index.condition?.code, isDay: index.isDay)
        
    }
    
}
