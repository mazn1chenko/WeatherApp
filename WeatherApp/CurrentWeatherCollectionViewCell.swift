//
//  MainCollecitonViewCell.swift
//  WeatherApp
//
//  Created by m223 on 05.10.2023.
//

import UIKit

class CurrentWeatherCollectionViewCell: UICollectionViewCell {
    
    static let cellId = "MainCellId"
    
    //MARK: Label
    let locationNameLabel = UILabel()
    let currentlyDateLabel = UILabel()
    let currentTempLabel = UILabel()
    let stateOfWeatherTextLabel = UILabel()
    
    //MARK: ImageView
    let stateOfWeatherImage = UIImageView()
    
    //MARK: detailsOfCurrentWeatherStackView
    let detailsOfCurrentWeatherStackView = UIStackView()
    let speedAndPressureStackView = UIStackView()
    let chanceOfRainAndHudimityStackView = UIStackView()
    
    let speedOfAirStackView: UIStackView = {
        let stackView = UIStackView()
        
        let imageOfSpeed = UIImageView()
        imageOfSpeed.image = UIImage(named: "carbon_location-current")
        imageOfSpeed.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        stackView.addArrangedSubview(imageOfSpeed)

        let speedOfAirLabel = UILabel()
        speedOfAirLabel.numberOfLines = 2
        speedOfAirLabel.text = "3.7 km/h \nWind"
        speedOfAirLabel.font = UIFont(name: "Poppins-Regular", size: 14)
        stackView.addArrangedSubview(speedOfAirLabel)
        
        return stackView
        
        
    }()
    
    let pressureOfAirStackView: UIStackView = {
        let stackView = UIStackView()

        
        let imageOfPressure = UIImageView()
        imageOfPressure.image = UIImage(named: "temperature")
        imageOfPressure.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        stackView.addArrangedSubview(imageOfPressure)

        let pressureTextLabel = UILabel()
        pressureTextLabel.numberOfLines = 2
        pressureTextLabel.text = "1010 mbar \nPressure"
        pressureTextLabel.font = UIFont(name: "Poppins-Regular", size: 14)
        stackView.addArrangedSubview(pressureTextLabel)
        
        return stackView
        
        
    }()
    
    let chanceOfRainStackView: UIStackView = {
        let stackView = UIStackView()
        
        let imageOfSpeed = UIImageView()
        imageOfSpeed.image = UIImage(named: "rain 1")
        imageOfSpeed.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        stackView.addArrangedSubview(imageOfSpeed)

        let speedOfAirLabel = UILabel()
        speedOfAirLabel.numberOfLines = 2
        speedOfAirLabel.text = "74% \nChance of rain"
        speedOfAirLabel.font = UIFont(name: "Poppins-Regular", size: 14)
        stackView.addArrangedSubview(speedOfAirLabel)
        
        return stackView
        
        
    }()
    
    let hudimityStackView: UIStackView = {
        let stackView = UIStackView()
        
        let imageOfHudimity = UIImageView()
        imageOfHudimity.image = UIImage(named: "ion_water-outline")
        imageOfHudimity.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        stackView.addArrangedSubview(imageOfHudimity)

        let hudimityTextLabel = UILabel()
        hudimityTextLabel.numberOfLines = 2
        hudimityTextLabel.text = "83% \nHudimity 83%"
        hudimityTextLabel.font = UIFont(name: "Poppins-Regular", size: 14)
        stackView.addArrangedSubview(hudimityTextLabel)
        
        return stackView
        
        
    }()
    
    
    //MARK: Separator
    let separator = UIView()
        
    override init(frame: CGRect) {
        super.init(frame: frame)

        makingViewBackgroundGradient()
        setupViews()
        setupLayouts()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        
        locationNameLabel.translatesAutoresizingMaskIntoConstraints = false
        locationNameLabel.text = "Kharkiv"
        locationNameLabel.font = .boldSystemFont(ofSize: 20)
        
        stateOfWeatherImage.translatesAutoresizingMaskIntoConstraints = false
        stateOfWeatherImage.image = UIImage(named: "sunny-black")
        
        detailsOfCurrentWeatherStackView.translatesAutoresizingMaskIntoConstraints = false
        detailsOfCurrentWeatherStackView.axis = .horizontal
        detailsOfCurrentWeatherStackView.distribution = .fillEqually
        detailsOfCurrentWeatherStackView.spacing = 0
                
        speedAndPressureStackView.axis = .vertical
        speedAndPressureStackView.distribution = .fill
        speedAndPressureStackView.spacing = 5
        
        chanceOfRainAndHudimityStackView.axis = .vertical
        chanceOfRainAndHudimityStackView.distribution = .fill
        chanceOfRainAndHudimityStackView.spacing = 5
        
        speedOfAirStackView.axis = .horizontal
        speedOfAirStackView.distribution = .fill
        speedOfAirStackView.spacing = 5
        
        pressureOfAirStackView.axis = .horizontal
        pressureOfAirStackView.distribution = .fill
        pressureOfAirStackView.spacing = 5
                
        chanceOfRainStackView.axis = .horizontal
        chanceOfRainStackView.distribution = .fill
        chanceOfRainStackView.spacing = 5
                        
        hudimityStackView.axis = .horizontal
        hudimityStackView.distribution = .fill
        hudimityStackView.spacing = 5
        
        pressureOfAirStackView.axis = .horizontal
        pressureOfAirStackView.distribution = .fill
        pressureOfAirStackView.spacing = 5
        
        
        
        currentlyDateLabel.translatesAutoresizingMaskIntoConstraints = false
        currentlyDateLabel.text = "Sunday | Nov 14"
        currentlyDateLabel.font = UIFont(name: "Poppins-Regular", size: 20)
        currentlyDateLabel.textAlignment = .center
        
        currentTempLabel.translatesAutoresizingMaskIntoConstraints = false
        currentTempLabel.text = "24°"
        currentTempLabel.font = UIFont(name: "Poppins-SemiBold", size: 48)
        currentTempLabel.shadowColor = UIColor.black
        currentTempLabel.shadowOffset = CGSize(width: 1, height: 1)
        currentTempLabel.shadowColor?.withAlphaComponent(0.8)
        currentTempLabel.textAlignment = .center

        
        stateOfWeatherTextLabel.translatesAutoresizingMaskIntoConstraints = false
        stateOfWeatherTextLabel.text = "Sunny"
        stateOfWeatherTextLabel.font = UIFont(name: "Poppins-Regular", size: 20)
        stateOfWeatherTextLabel.textAlignment = .center
        
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.backgroundColor = .white
        
    }
    
    private func setupLayouts() {
        addSubview(locationNameLabel)
        addSubview(stateOfWeatherImage)
        addSubview(detailsOfCurrentWeatherStackView)
        detailsOfCurrentWeatherStackView.addArrangedSubview(speedAndPressureStackView)
        detailsOfCurrentWeatherStackView.addArrangedSubview(chanceOfRainAndHudimityStackView)
        speedAndPressureStackView.addArrangedSubview(speedOfAirStackView)
        speedAndPressureStackView.addArrangedSubview(pressureOfAirStackView)
        chanceOfRainAndHudimityStackView.addArrangedSubview(chanceOfRainStackView)
        chanceOfRainAndHudimityStackView.addArrangedSubview(hudimityStackView)
        addSubview(currentlyDateLabel)
        addSubview(currentTempLabel)
        addSubview(stateOfWeatherTextLabel)
        addSubview(separator)
        
        NSLayoutConstraint.activate([
        
            locationNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            locationNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
        
            stateOfWeatherImage.bottomAnchor.constraint(equalTo: centerYAnchor, constant: -25),
            stateOfWeatherImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            stateOfWeatherImage.heightAnchor.constraint(equalToConstant: frame.width / 3),
            stateOfWeatherImage.widthAnchor.constraint(equalToConstant: frame.width / 3),
            
            detailsOfCurrentWeatherStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            detailsOfCurrentWeatherStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            detailsOfCurrentWeatherStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            detailsOfCurrentWeatherStackView.topAnchor.constraint(equalTo: topAnchor, constant: frame.height / 4 * 3.1),
            
            currentlyDateLabel.topAnchor.constraint(equalTo: centerYAnchor),
            currentlyDateLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            currentTempLabel.topAnchor.constraint(equalTo: currentlyDateLabel.bottomAnchor),
            currentTempLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            stateOfWeatherTextLabel.topAnchor.constraint(equalTo: currentTempLabel.bottomAnchor),
            stateOfWeatherTextLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            separator.bottomAnchor.constraint(equalTo: detailsOfCurrentWeatherStackView.topAnchor),
            separator.centerXAnchor.constraint(equalTo: centerXAnchor),
            separator.widthAnchor.constraint(equalToConstant: frame.width - 40),
            separator.heightAnchor.constraint(equalToConstant: 2)
            
        ])
        
    }
    
    private func makingViewBackgroundGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        
        let firstColor = UIColor(red: 98.0/255.0, green: 184.0/255.0, blue: 246.0/255.0, alpha: 1.0).cgColor
        let secondColor = UIColor(red: 44.0/255.0, green: 121.0/255.0, blue: 193.0/255.0, alpha: 1.0).cgColor
        gradientLayer.colors = [firstColor, secondColor]
        
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        
        layer.addSublayer(gradientLayer)
    }
    
}
