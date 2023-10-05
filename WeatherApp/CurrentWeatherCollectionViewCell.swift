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
    
    //MARK: DetailsOfCurrentWeatherStackView
    let detailsOfCurrentWeatherStackView = UIStackView()
    let speedAndPressureStackView = UIStackView()
    let chanceOfRainAndHudimityStackView = UIStackView()
    
    //MARK: WindSpeedStackView
    let windSpeedStackView =  UIStackView()
    let windSpeedImage = UIImageView()
    let windSpeedLabel = UILabel()

    //MARK: PressureOfAirStackView
    let pressureOfAirStackView = UIStackView()
    let pressureImageView = UIImageView()
    let pressureTextLabel = UILabel()

    //MARK: ChanceOfRainStackView
    let cloudyStackView = UIStackView()
    let cloudyImageView = UIImageView()
    let cloudyLabel = UILabel()
    
    //MARK: HudimityStackView
    let hudimityStackView = UIStackView()
    let hudimitiImageView = UIImageView()
    let hudimityTextLabel = UILabel()
    
    
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
        locationNameLabel.text = "Veleten"
        locationNameLabel.font = UIFont(name: "Poppins-SemiBold", size: 24)

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
        
        //MARK: WindSpeedStackView
        windSpeedStackView.axis = .horizontal
        windSpeedStackView.distribution = .fill
        windSpeedStackView.spacing = 5
        
        windSpeedLabel.numberOfLines = 2
        windSpeedLabel.text = "3.7 km/h \nWind"
        windSpeedLabel.font = UIFont(name: "Poppins-Regular", size: 14)
    
        windSpeedImage.image = UIImage(named: "carbon_location-current")
        windSpeedImage.frame = CGRect(x: 0, y: 0, width: 20, height: 20)

        //MARK: PressureOfAirStackView
        pressureOfAirStackView.axis = .horizontal
        pressureOfAirStackView.distribution = .fill
        pressureOfAirStackView.spacing = 5
        
        pressureImageView.image = UIImage(named: "temperature")
        pressureImageView.frame = CGRect(x: 0, y: 0, width: 20, height: 20)

        pressureTextLabel.numberOfLines = 2
        pressureTextLabel.text = "1010 mbar \nPressure"
        pressureTextLabel.font = UIFont(name: "Poppins-Regular", size: 14)
                
        //MARK: ChanceOfRainStackView
        cloudyStackView.axis = .horizontal
        cloudyStackView.distribution = .fill
        cloudyStackView.spacing = 5
        
        cloudyImageView.image = UIImage(named: "partly-cloudy-day")
        cloudyImageView.frame = CGRect(x: 0, y: 0, width: 20, height: 20)

        cloudyLabel.numberOfLines = 2
        cloudyLabel.text = "74% \nChance of rain"
        cloudyLabel.font = UIFont(name: "Poppins-Regular", size: 14)
           
        //MARK: HudimityStackView
        hudimityStackView.axis = .horizontal
        hudimityStackView.distribution = .fill
        hudimityStackView.spacing = 5
        
        hudimitiImageView.image = UIImage(named: "ion_water-outline")
        hudimitiImageView.frame = CGRect(x: 0, y: 0, width: 20, height: 20)

        hudimityTextLabel.numberOfLines = 2
        hudimityTextLabel.text = "83% \nHudimity 83%"
        hudimityTextLabel.font = UIFont(name: "Poppins-Regular", size: 14)

        
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
        
        speedAndPressureStackView.addArrangedSubview(windSpeedStackView)
        speedAndPressureStackView.addArrangedSubview(pressureOfAirStackView)
        
        chanceOfRainAndHudimityStackView.addArrangedSubview(cloudyStackView)
        chanceOfRainAndHudimityStackView.addArrangedSubview(hudimityStackView)
        
        windSpeedStackView.addArrangedSubview(windSpeedImage)
        windSpeedStackView.addArrangedSubview(windSpeedLabel)
        
        pressureOfAirStackView.addArrangedSubview(pressureImageView)
        pressureOfAirStackView.addArrangedSubview(pressureTextLabel)
        
        cloudyStackView.addArrangedSubview(cloudyImageView)
        cloudyStackView.addArrangedSubview(cloudyLabel)
        
        hudimityStackView.addArrangedSubview(hudimitiImageView)
        hudimityStackView.addArrangedSubview(hudimityTextLabel)
        
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
    
    func setupSpeedOfAirStackView() {
        
        
    }
    
    func configurateCell(model: CurrentWeatherModel) {
        
        locationNameLabel.text = model.location?.name
        currentTempLabel.text = "\(Int(model.current?.tempC ?? 000))°"
        stateOfWeatherTextLabel.text = "\(model.current?.condition?.text ?? "NothingToSay")"
        hudimityTextLabel.text = "\(model.current?.humidity ?? 000)% \nHudimity \(model.current?.humidity ?? 000)%"
        windSpeedLabel.text = "\(model.current?.windKph ?? 000) km/h \nWind"
        pressureTextLabel.text = "\(model.current?.pressureMB ?? 000) mbar \nPressure"
        cloudyLabel.text = "\(model.current?.cloud ?? 000)% \nCloudy \(model.current?.cloud ?? 000)%"
        
        let timestamp = model.location?.localtimeEpoch
        let date = Date(timeIntervalSince1970: TimeInterval(timestamp ?? 0))

        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.dateFormat = "EEEE | d MMMM"

        let formattedDate = dateFormatter.string(from: date)
        currentlyDateLabel.text = formattedDate

    }
    
}

