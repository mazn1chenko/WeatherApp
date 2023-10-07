//
//  MainViewController.swift
//  WeatherApp
//
//  Created by m223 on 05.10.2023.
//

import UIKit

final class MainViewController: UIViewController {
    
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
    
    var currentWeatherArray = [CurrentWeatherModel]()
        
    var timeForForecastWeather2DaysArray = [Hour]()
    
    //MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupViews()
        setupLayouts()
        gettingDataForCurrentWeather()
        gettingDataForForecastWeatherForDay()
    }
    
    
    //MARK: - Functions setupViews and setupLayouts
    
    //MARK: setupViews

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
        forecastWeatherCollectionView.backgroundColor = .backgroundOfView
        
        backgroundViewForForecastWeather.translatesAutoresizingMaskIntoConstraints = false
        backgroundViewForForecastWeather.backgroundColor = .backgroundOfView
        
        headerForForecastWeatherLabel.translatesAutoresizingMaskIntoConstraints = false
        headerForForecastWeatherLabel.formatterDateEEEEMMMdd()

        headerForForecastWeatherLabel.font = UIFont(name: "Poppins-Medium", size: 18)
        
        forecastFor7DaysStackView.translatesAutoresizingMaskIntoConstraints = false
        forecastFor7DaysStackView.axis = .horizontal
        forecastFor7DaysStackView.distribution = .equalCentering
        
        forecastFor7DaysBottom.setTitle("Forecast for 7 Days".localized(), for: .normal)
        forecastFor7DaysBottom.titleLabel?.font = UIFont(name: "Poppins-Medium", size: 18)
        forecastFor7DaysBottom.setTitleColor(.backgroundOfView, for: .normal)
        forecastFor7DaysBottom.addTarget(self, action: #selector(presentForecast7DayVC), for: .touchUpInside)
        
        forecastFor7DaysImageView.image = UIImage(named: "eva_arrow-ios-downward-outline")
        
        
    }
    
    //MARK: setupLayouts

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
            
            forecastFor7DaysStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 5),
            forecastFor7DaysStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            forecastFor7DaysImageView.heightAnchor.constraint(equalToConstant: 32),
            forecastFor7DaysImageView.widthAnchor.constraint(equalToConstant: 32),
            
            forecastWeatherCollectionView.topAnchor.constraint(equalTo: headerForForecastWeatherLabel.bottomAnchor, constant: 5),
            forecastWeatherCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            forecastWeatherCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            forecastWeatherCollectionView.bottomAnchor.constraint(equalTo: forecastFor7DaysStackView.topAnchor, constant: -1),
            
            backgroundViewForForecastWeather.topAnchor.constraint(equalTo: currentWeatherCollectionView.bottomAnchor, constant: 10),
            backgroundViewForForecastWeather.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundViewForForecastWeather.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundViewForForecastWeather.bottomAnchor.constraint(equalTo: forecastFor7DaysStackView.topAnchor, constant: -10),
            
            headerForForecastWeatherLabel.topAnchor.constraint(equalTo: backgroundViewForForecastWeather.topAnchor, constant: 10),
            headerForForecastWeatherLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            
            
        ])
        
    }
    
    //MARK: - Network
    
    func gettingDataForCurrentWeather() {
        
        self.currentWeatherArray.removeAll()
        
        NetworkManager.shared.fetchCurrentWeather { CurrentWeather in
            self.currentWeatherArray.append(CurrentWeather)
            
            DispatchQueue.main.async {
                self.currentWeatherCollectionView.reloadData()
            }
        }
    }
    
    func gettingDataForForecastWeatherForDay() {
        
        self.timeForForecastWeather2DaysArray.removeAll()
        
        NetworkManager.shared.fetchForcatsWeatherFor2Days { Forecastweather in
            
            var todayTime = Forecastweather.forecast?.forecastday?[0].hour ?? []
            
            let currentEpochTime = Int(Date().timeIntervalSince1970)
            
            todayTime = todayTime.filter { model in
                if let timeEpoch = model.timeEpoch {
                    return timeEpoch >= currentEpochTime
                }
                return false
            }
            
            todayTime += Forecastweather.forecast?.forecastday?[1].hour ?? []
            
            self.timeForForecastWeather2DaysArray = todayTime
            
            DispatchQueue.main.async {
                
                self.forecastWeatherCollectionView.reloadData()
                
            }
        }
    
    }
    
    
    //MARK: Objc func for targer/button
    
    @objc func openSettingsView() {
        
        navigationController?.pushViewController(SettingsViewController(), animated: true)
    }
    
    @objc func openManagerLocation() {
        
        let viewControllerToPush = ManageLocationViewController()

        let transition = CATransition()
        transition.duration = 0.3
        transition.type = .push
        transition.subtype = .fromLeft

        navigationController?.view.layer.add(transition, forKey: kCATransition)
        navigationController?.pushViewController(viewControllerToPush, animated: false)
    }
    
    @objc func presentForecast7DayVC() {
        
        navigationController?.present(ForecastWeatherFor7DaysViewController(), animated: true)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        gettingDataForCurrentWeather()
        gettingDataForForecastWeatherForDay()
        
        DispatchQueue.main.async {
            self.forecastWeatherCollectionView.reloadData()
            self.currentWeatherCollectionView.reloadData()
        }
    }

}



//MARK: - UICollectionViewDataSource

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == currentWeatherCollectionView {
            return currentWeatherArray.count
        }else {
            return timeForForecastWeather2DaysArray.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == currentWeatherCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CurrentWeatherCollectionViewCell.cellId, for: indexPath) as? CurrentWeatherCollectionViewCell
            
            cell?.configurateCell(model: currentWeatherArray[indexPath.row])
            cell?.settingsButton.addTarget(self, action: #selector(openSettingsView), for: .touchUpInside)
            cell?.managerLocationButton.addTarget(self, action: #selector(openManagerLocation), for: .touchUpInside)
            return cell!
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ForecastWeatherCollectionViewCell.cellId, for: indexPath) as? ForecastWeatherCollectionViewCell

            cell?.configureCell(index: timeForForecastWeather2DaysArray[indexPath.row])
            
            return cell!
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

            return CGSize(width: forecastWeatherCollectionView.frame.width / 4,
                          height: forecastWeatherCollectionView.frame.height)
        }
    }
}

//MARK: - UICollectionViewDelegate

extension MainViewController: UICollectionViewDelegate {
    
    
}


