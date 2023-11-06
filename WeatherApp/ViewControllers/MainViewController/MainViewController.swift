//
//  MainViewController.swift
//  WeatherApp
//
//  Created by m223 on 05.10.2023.
//

import UIKit
import Reachability

final class MainViewController: UIViewController {
    
    private let currentWeatherCollectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CurrentWeatherCollectionViewCell.self, forCellWithReuseIdentifier: CurrentWeatherCollectionViewCell.cellId)
        return collectionView
        
    }()
    
    private let forecastWeatherCollectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset =  UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(ForecastWeatherCollectionViewCell.self, forCellWithReuseIdentifier: ForecastWeatherCollectionViewCell.cellId)
        return collectionView
        
        
    }()
    
    private let forecastFor7DaysStackView = UIStackView()
    
    private let forecastFor7DaysBottom = UIButton()
    
    private let forecastFor7DaysImageView = UIImageView()
    
    private let backgroundViewForForecastWeather = UIView()
    
    private let headerForForecastWeatherLabel = UILabel()
    
    private var currentWeatherArray = [CurrentWeatherModel]()
        
    private var timeForForecastWeather2DaysArray = [Hour]()
    
    
    //MARK: - ViewDidLoad
      
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupViews()
        setupLayouts()
        getApiUser()
        
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
    
    
    //MARK: - viewWillAppear
    
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
   //empty
   //created for future functions
    
}

//MARK: - Network

extension MainViewController {
    
    //MARK: Getting data with connection to internet
    private func gettingDataForCurrentWeather() {
        
        NetworkManager.shared.fetchCurrentWeather { [weak self] CurrentWeather in
            guard let self = self else { return }
            
            
            self.currentWeatherArray.removeAll()
            self.currentWeatherArray.append(CurrentWeather)

            // Сериализовать массив и сохранить его в UserDefaults
            if let encodedData = try? JSONEncoder().encode(self.currentWeatherArray) {
                UserDefaults.standard.removeObject(forKey: "LastSessionCurrentWeather")
                UserDefaults.standard.set(encodedData, forKey: "LastSessionCurrentWeather")
                UserDefaults.standard.set(encodedData, forKey: "FirstCurrentLocation")
                UserDefaults.standard.synchronize()

            } else {
                print("Ошибка при кодировании данных.")
            }

            DispatchQueue.main.async {
                self.currentWeatherCollectionView.reloadData()
            }
        }
    }
    
    private func gettingDataForForecastWeatherForDay() {
        
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
                if let encodedData = try? NSKeyedArchiver.archivedData(withRootObject: self.timeForForecastWeather2DaysArray, requiringSecureCoding: false) {
                    UserDefaults.standard.removeObject(forKey: "LastSesionDataForForecastWeatherForDay")
                    UserDefaults.standard.set(encodedData, forKey: "LastSesionDataForForecastWeatherForDay")
                }

            }
        }
    
    }
    
    
    //MARK: Last Session Data
    
    private func gettingLastSesionDataForCurrentWeather() {
        
        if let savedData = UserDefaults.standard.data(forKey: "LastSessionCurrentWeather") {
            if let loadedArray = try? JSONDecoder().decode([CurrentWeatherModel].self, from: savedData) {
                self.currentWeatherArray.append(loadedArray.last!)
                self.currentWeatherCollectionView.reloadData()

            } else {
                print("Ошибка при распаковке данных из UserDefaults.")
            }
        } else {
            print("Данные отсутствуют в UserDefaults.")
        }
            
        self.currentWeatherCollectionView.reloadData()

    }
    
    private func gettingLastSesionDataForForecastWeatherForDay() {
        
            self.timeForForecastWeather2DaysArray.removeAll()
        if let savedData = UserDefaults.standard.data(forKey: "LastSesionDataForForecastWeatherForDay"),
           let timeForForecastWeather2DaysArray = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(savedData) as? [Hour] {
            
            self.timeForForecastWeather2DaysArray = timeForForecastWeather2DaysArray
            self.forecastWeatherCollectionView.reloadData()
            
        } else {

            print("gg in gettingLastSesionDataForForecastWeatherForDay")
        }
            
        
    }
    
    
    
//    private func saveFirstCurrentLocation() {
//
//        NetworkManager.shared.fetchCurrentWeather { [weak self] CurrentWeather in
//            guard let self = self else { return }
//
//
//            self.currentWeatherArray.removeAll()
//            self.currentWeatherArray.append(CurrentWeather)
//
//            // Сериализовать массив и сохранить его в UserDefaults
//            if let encodedData = try? JSONEncoder().encode(self.currentWeatherArray) {
//                UserDefaults.standard.removeObject(forKey: "FirstCurrentLocation")
//                UserDefaults.standard.set(encodedData, forKey: "FirstCurrentLocation")
//                UserDefaults.standard.synchronize()
//
//            } else {
//                print("Ошибка при кодировании данных.")
//            }
//
//        }
//
//
//
//    }
    
    //MARK: Main internter function
    
    private func getApiUser() {
        
        NetworkManager.shared.getIPAddress { Location in
            
            if !self.checkInternetConnection() {
                self.showNoInternetAlert()
                self.gettingLastSesionDataForCurrentWeather()
                self.gettingLastSesionDataForForecastWeatherForDay()
                
            }else {

                self.gettingDataForCurrentWeather()
                self.gettingDataForForecastWeatherForDay()
                
            }
        }
        
    }
    
    private func checkInternetConnection() -> Bool {
        do {
            let reachability = try Reachability()
            try reachability.startNotifier()

            let currentStatus = reachability.connection
            switch currentStatus {
            case .wifi, .cellular:
                return true
            case .unavailable:
                
                Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false) { timer in
                    self.checkAndRetryNetworkRequest()
                }
                return false
            }
        } catch {
            return false
        }
    }
    
    private func checkAndRetryNetworkRequest() {
        if checkInternetConnection() {

            getApiUser()
        } else {
            
        }
    }

    //MARK: Network alert
    
    private func showNoInternetAlert() {
        
        NotificationCenter.shared.showAlertWith(title: "No Internet Connection", message: "Please check your internet connection and try again.".localized(), navigationController: self)

    }

    
}




