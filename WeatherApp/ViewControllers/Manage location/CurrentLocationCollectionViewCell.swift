//
//  CurrentLocationCollectionViewCell.swift
//  WeatherApp
//
//  Created by m223 on 09.10.2023.
//

import Foundation
import UIKit

class CurrentLocationCollectionViewCell: UICollectionViewCell {
    
    static let cellId = "CurrentLocationCollectionViewCell"
    
    private let nameAndTempStackView = UIStackView()
    
    private let stateOfWeatherImageAndTextUIStackView = UIStackView()
    
    private let stateOfWeatherImageView = UIImageView()
    
    private let nameOfLocationUILabel = UILabel()
    
    private let currentTempUILabel = UILabel()
    
    private let currentStateOfWeatherUILabel = UILabel()
    
    let weatherOfCurrentLocationImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupLayouts()
        backgroundColor = .white
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Functions setupViews and setupLayouts

    //MARK: setupViews

    private func setupViews() {
        
        nameAndTempStackView.translatesAutoresizingMaskIntoConstraints = false
        nameAndTempStackView.axis = .vertical
        nameAndTempStackView.distribution = .fillProportionally
        nameAndTempStackView.spacing = 2
        
        stateOfWeatherImageAndTextUIStackView.translatesAutoresizingMaskIntoConstraints = false
        stateOfWeatherImageAndTextUIStackView.axis = .vertical
        stateOfWeatherImageAndTextUIStackView.alignment = .center
        stateOfWeatherImageAndTextUIStackView.distribution = .fill
        
        stateOfWeatherImageView.translatesAutoresizingMaskIntoConstraints = false
        stateOfWeatherImageView.image = UIImage(named: "rain 1")
        
        nameOfLocationUILabel.text = "Name of location"
        nameOfLocationUILabel.font = UIFont(name: "Poppins-Medium", size: 18)
        nameOfLocationUILabel.textColor = .black

        currentStateOfWeatherUILabel.text = "Cloudy"
        currentStateOfWeatherUILabel.font = UIFont(name: "Poppins-Regular", size: 16)
        currentStateOfWeatherUILabel.textColor = .gray
        currentStateOfWeatherUILabel.textAlignment = .center

        
        currentTempUILabel.text = "24°/27°"
        currentTempUILabel.font = UIFont(name: "Poppins-Regular", size: 16)
        currentTempUILabel.textColor = .gray
        
        weatherOfCurrentLocationImageView.translatesAutoresizingMaskIntoConstraints = false
        weatherOfCurrentLocationImageView.isHidden = true
        weatherOfCurrentLocationImageView.image = UIImage(named: "ph_map-pin")

        
        
    }
    
    //MARK: setupLayouts
    
    private func setupLayouts() {
        
        addSubview(nameAndTempStackView)
        nameAndTempStackView.addArrangedSubview(nameOfLocationUILabel)
        nameAndTempStackView.addArrangedSubview(currentTempUILabel)
        
        addSubview(stateOfWeatherImageAndTextUIStackView)
        stateOfWeatherImageAndTextUIStackView.addArrangedSubview(stateOfWeatherImageView)
        stateOfWeatherImageAndTextUIStackView.addArrangedSubview(currentStateOfWeatherUILabel)

        addSubview(weatherOfCurrentLocationImageView)
        
        
        let baseOffseats: CGFloat = 20

        NSLayoutConstraint.activate([
        
            
            nameAndTempStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameAndTempStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: baseOffseats),
            
            stateOfWeatherImageAndTextUIStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stateOfWeatherImageAndTextUIStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -baseOffseats),
                        
            weatherOfCurrentLocationImageView.topAnchor.constraint(equalTo: nameAndTempStackView.topAnchor, constant: 1),
            weatherOfCurrentLocationImageView.leadingAnchor.constraint(equalTo: nameAndTempStackView.trailingAnchor, constant: 1),
            weatherOfCurrentLocationImageView.heightAnchor.constraint(equalToConstant: 16),
            weatherOfCurrentLocationImageView.widthAnchor.constraint(equalToConstant: 16),
            
        ])
        
    }
    
    
    //MARK: - Configure cell
    
    func configureCell(model: CurrentWeatherModel) {
        
        nameOfLocationUILabel.text = "\(model.location?.name ?? "Error")"
        currentTempUILabel.text = "\(Int(NSDecimalNumber(decimal: model.current?.tempC ?? -0).doubleValue))°"
        stateOfWeatherImageView.setWeatherIcon(withCode: model.current?.condition?.code, isDay: model.current?.isDay)
        currentStateOfWeatherUILabel.text = "\(model.current?.condition?.text ?? "Error")"
        
    }
    
    
}
