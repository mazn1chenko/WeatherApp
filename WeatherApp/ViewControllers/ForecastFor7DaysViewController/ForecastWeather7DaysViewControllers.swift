//
//  ForecastWeatherFor7Days.swift
//  WeatherApp
//
//  Created by m223 on 07.10.2023.
//

import Foundation
import UIKit

class ForecastWeatherFor7DaysViewController: UIViewController {
    
    let forecastWeatherFor7DaysTableView = UITableView()
    
    let headerLabel = UILabel()
    
    var forecastFor7DaysArray = [Forecastday]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .backgroundOfView
        
        setupViews()
        setupLayouts()
        network()
    }
    
    private func setupViews() {
        
        forecastWeatherFor7DaysTableView.translatesAutoresizingMaskIntoConstraints = false
        forecastWeatherFor7DaysTableView.delegate = self
        forecastWeatherFor7DaysTableView.dataSource = self
        forecastWeatherFor7DaysTableView.register(ForecastWeatherFor7DaysTableViewCell.self, forCellReuseIdentifier: ForecastWeatherFor7DaysTableViewCell.cellId)
        forecastWeatherFor7DaysTableView.isScrollEnabled = false
        
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.text = "Forecast for 7 Days"
        headerLabel.font = UIFont(name: "Poppins-Medium", size: 18)
        
    }
    
    private func setupLayouts() {
        view.addSubview(forecastWeatherFor7DaysTableView)
        view.addSubview(headerLabel)
        
        NSLayoutConstraint.activate([
            
            headerLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 15),
            headerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),

            forecastWeatherFor7DaysTableView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 15),
            forecastWeatherFor7DaysTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            forecastWeatherFor7DaysTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            forecastWeatherFor7DaysTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
    }
    //MARK: Network
    
    func network() {
        
        
        NetworkManager.shared.fetchForcatsWeatherFor7Days { ForecastWeather in
            
            if let forecastday = ForecastWeather.forecast?.forecastday {
                self.forecastFor7DaysArray.append(contentsOf: forecastday)
            }
            
            
            
            DispatchQueue.main.async {
                self.forecastWeatherFor7DaysTableView.reloadData()
            }
        }
        
        
    }
    
}

    //MARK: - UITableViewDelegate

extension ForecastWeatherFor7DaysViewController: UITableViewDelegate {
    
    
}

    //MARK: - UITableViewDataSource

extension ForecastWeatherFor7DaysViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { forecastFor7DaysArray.count }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ForecastWeatherFor7DaysTableViewCell.cellId, for: indexPath) as? ForecastWeatherFor7DaysTableViewCell
        
        cell?.configureCell(model: forecastFor7DaysArray[indexPath.row])
        
        cell?.backgroundColor = .backgroundOfView
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { view.frame.height / 7.5 }
    
    
    
}


