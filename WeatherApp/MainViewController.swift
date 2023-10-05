//
//  MainViewController.swift
//  WeatherApp
//
//  Created by m223 on 05.10.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    let currentWeatherCollectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CurrentWeatherCollectionViewCell.self, forCellWithReuseIdentifier: CurrentWeatherCollectionViewCell.cellId)
        return collectionView
        
    }()
    
    let forecastWeatherCollectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset =  UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(ForecastWeatherCollectionViewCell.self, forCellWithReuseIdentifier: ForecastWeatherCollectionViewCell.cellId)
        return collectionView
        
        
    }()
    
    let forecastFor7DaysStackView = UIStackView()
    
    let forecastFor7DaysBottom = UIButton()
    
    let forecastFor7DaysImageView = UIImageView()

    let backgroundViewForForecastWeather = UIView()
    
    let headerForForecastWeatherLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupViews()
        setupLayouts()
    }
    
    private func setupViews() {
        
        currentWeatherCollectionView.translatesAutoresizingMaskIntoConstraints = false
        currentWeatherCollectionView.delegate = self
        currentWeatherCollectionView.dataSource = self
        currentWeatherCollectionView.layer.cornerRadius = 20
        currentWeatherCollectionView.isPagingEnabled = true
        
        forecastWeatherCollectionView.translatesAutoresizingMaskIntoConstraints = false
        forecastWeatherCollectionView.delegate = self
        forecastWeatherCollectionView.dataSource = self
        forecastWeatherCollectionView.isPagingEnabled = false
        forecastWeatherCollectionView.backgroundColor = .init(red: 44.0/255.0, green: 121.0/255.0, blue: 193.0/255.0, alpha: 1.0)

        backgroundViewForForecastWeather.translatesAutoresizingMaskIntoConstraints = false
        backgroundViewForForecastWeather.backgroundColor = .init(red: 44.0/255.0, green: 121.0/255.0, blue: 193.0/255.0, alpha: 1.0)
                
        headerForForecastWeatherLabel.translatesAutoresizingMaskIntoConstraints = false
        headerForForecastWeatherLabel.text = "Sunday | Nov 14"
        headerForForecastWeatherLabel.font = UIFont(name: "Poppins-Medium", size: 18)

        forecastFor7DaysStackView.translatesAutoresizingMaskIntoConstraints = false
        forecastFor7DaysStackView.axis = .horizontal
        forecastFor7DaysStackView.distribution = .equalCentering
        
        forecastFor7DaysBottom.setTitle("Forecast for 7 Days", for: .normal)
        forecastFor7DaysBottom.titleLabel?.font = UIFont(name: "Poppins-Medium", size: 18)
        forecastFor7DaysBottom.setTitleColor(UIColor(red: 44.0/255.0, green: 121.0/255.0, blue: 193.0/255.0, alpha: 1.0), for: .normal)

        forecastFor7DaysImageView.image = UIImage(named: "eva_arrow-ios-downward-outline")
        
        
    }

    private func setupLayouts() {
        view.addSubview(backgroundViewForForecastWeather)
        view.addSubview(currentWeatherCollectionView)
        view.addSubview(forecastWeatherCollectionView)
        view.addSubview(forecastFor7DaysBottom)
        view.addSubview(headerForForecastWeatherLabel)
        view.addSubview(forecastFor7DaysStackView)
        forecastFor7DaysStackView.addArrangedSubview(forecastFor7DaysBottom)
        forecastFor7DaysStackView.addArrangedSubview(forecastFor7DaysImageView)
        
        NSLayoutConstraint.activate([
        
            currentWeatherCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            currentWeatherCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            currentWeatherCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            currentWeatherCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -(view.frame.height / 4)),
            
            forecastFor7DaysStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            forecastFor7DaysStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            forecastWeatherCollectionView.topAnchor.constraint(equalTo: headerForForecastWeatherLabel.bottomAnchor, constant: 5),
            forecastWeatherCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            forecastWeatherCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            forecastWeatherCollectionView.bottomAnchor.constraint(equalTo: forecastFor7DaysStackView.topAnchor, constant: -10),
            
            backgroundViewForForecastWeather.topAnchor.constraint(equalTo: currentWeatherCollectionView.bottomAnchor, constant: 10),
            backgroundViewForForecastWeather.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundViewForForecastWeather.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundViewForForecastWeather.bottomAnchor.constraint(equalTo: forecastFor7DaysStackView.topAnchor, constant: -10),
            
            headerForForecastWeatherLabel.topAnchor.constraint(equalTo: backgroundViewForForecastWeather.topAnchor, constant: 10),
            headerForForecastWeatherLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            

        ])
        
    }


}

//MARK: - UICollectionViewDataSource

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == currentWeatherCollectionView {
            return 2
        }else {
            return 5
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == currentWeatherCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CurrentWeatherCollectionViewCell.cellId, for: indexPath)
            
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ForecastWeatherCollectionViewCell.cellId, for: indexPath)
            
            return cell
        }
    }
    
    
    
}

//MARK: - UICollectionViewDelegateFlowLayout

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == currentWeatherCollectionView {

            return CGSize(width: currentWeatherCollectionView.frame.width,
                          height: currentWeatherCollectionView.frame.height)
        }else{

            return CGSize(width: forecastWeatherCollectionView.frame.width / 5,
                          height: forecastWeatherCollectionView.frame.height)
        }
    }
}

//MARK: - UICollectionViewDelegate

extension MainViewController: UICollectionViewDelegate {
    
    
}


