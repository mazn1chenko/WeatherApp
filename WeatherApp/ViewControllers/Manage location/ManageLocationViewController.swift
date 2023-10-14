//
//  ManageLocationViewController.swift
//  WeatherApp
//
//  Created by m223 on 07.10.2023.
//

import Foundation
import UIKit

final class ManageLocationViewController: UIViewController {
    
    private let backgroundView = UIView()
    
    private let recentlySearchLocationCollectionView: UICollectionView = {
        
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .vertical
            layout.minimumInteritemSpacing = 0
            layout.minimumLineSpacing = 20
            
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
            collectionView.register(CurrentLocationCollectionViewCell.self, forCellWithReuseIdentifier: CurrentLocationCollectionViewCell.cellId)
            return collectionView
        
    }()
    
    private let titleLabel = UILabel()
        
    private let searchLocationBar = UISearchBar()
    
    private let customBackButton = UIButton(type: .system)
    
    private let resetRecentlyArray = UIButton(type: .system)
    
    var currentLocationArray = [CurrentWeatherModel]()
    
    var recentLocationArray = [CurrentWeatherModel]()
                
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.hidesBackButton = true

        fetchDataAboutAnotherLocation()
        setupViews()
        setupLayouts()
                        
    }
    
    //MARK: - Functions setupViews and setupLayouts

    //MARK: setupViews

    private func setupViews() {
        
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.backgroundColor = .backgroundOfView
        backgroundView.layer.cornerRadius = 20
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center
        titleLabel.text = "Location".localized()
        titleLabel.font = UIFont(name: "Poppins-SemiBold", size: 20)
        
        customBackButton.translatesAutoresizingMaskIntoConstraints = false
        customBackButton.setImage(UIImage(named: "bi_arrow-left-short"), for: .normal)
        customBackButton.tintColor = .white
        customBackButton.addTarget(self, action: #selector(backToMainView), for: .touchUpInside)
        
        resetRecentlyArray.setImage(.remove, for: .normal)
        resetRecentlyArray.translatesAutoresizingMaskIntoConstraints = false
        resetRecentlyArray.tintColor = .white
        resetRecentlyArray.addTarget(self, action: #selector(resetRecentLocation), for: .touchUpInside)
        
        searchLocationBar.translatesAutoresizingMaskIntoConstraints = false
        searchLocationBar.delegate = self
        searchLocationBar.tintColor = .black
        
        if let textFieldInsideSearchBar = searchLocationBar.value(forKey: "searchField") as? UITextField {
            textFieldInsideSearchBar.attributedPlaceholder = NSAttributedString(
                string: "Search Your City".localized(),
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
            )
        }
        
        if let searchIcon = UIImage(systemName: "magnifyingglass") {
            
            let redSearchIcon = searchIcon.withTintColor(.black, renderingMode: .alwaysOriginal)
            
            searchLocationBar.setImage(redSearchIcon, for: .search, state: .normal)
        }
        
        searchLocationBar.searchTextField.translatesAutoresizingMaskIntoConstraints = false
        searchLocationBar.searchTextField.textColor = .black
        
        searchLocationBar.layer.cornerRadius = 20
        searchLocationBar.searchBarStyle = .minimal
        searchLocationBar.barTintColor = UIColor(red: 242, green: 242, blue: 242, alpha: 1.0)
        searchLocationBar.searchTextField.backgroundColor = UIColor(red: 242, green: 242, blue: 242, alpha: 1.0)
        
        recentlySearchLocationCollectionView.translatesAutoresizingMaskIntoConstraints = false
        recentlySearchLocationCollectionView.delegate = self
        recentlySearchLocationCollectionView.dataSource = self
        recentlySearchLocationCollectionView.backgroundColor = .backgroundOfView

    }
    //MARK: - setupLayouts
    
    private func setupLayouts() {
        view.addSubview(backgroundView)
        backgroundView.addSubview(customBackButton)
        backgroundView.addSubview(resetRecentlyArray)
        backgroundView.addSubview(searchLocationBar)
        backgroundView.addSubview(titleLabel)
        backgroundView.addSubview(recentlySearchLocationCollectionView)
        
        let baseOffseats: CGFloat = 20
        
        NSLayoutConstraint.activate([
        
            backgroundView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            backgroundView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            backgroundView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            //MARK: Label`s Layout
            titleLabel.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 15),
            titleLabel.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),

            customBackButton.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 15),
            customBackButton.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: baseOffseats),
            customBackButton.heightAnchor.constraint(equalToConstant: 32),
            customBackButton.widthAnchor.constraint(equalToConstant: 32),
            
            resetRecentlyArray.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 15),
            resetRecentlyArray.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -baseOffseats),
            resetRecentlyArray.heightAnchor.constraint(equalToConstant: 32),
            resetRecentlyArray.widthAnchor.constraint(equalToConstant: 32),
            
            searchLocationBar.topAnchor.constraint(equalTo: customBackButton.bottomAnchor, constant: 30),
            searchLocationBar.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: baseOffseats),
            searchLocationBar.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -baseOffseats),
            searchLocationBar.heightAnchor.constraint(equalToConstant: 44),
            
            searchLocationBar.searchTextField.topAnchor.constraint(equalTo: searchLocationBar.topAnchor),
            searchLocationBar.searchTextField.leadingAnchor.constraint(equalTo: searchLocationBar.leadingAnchor),
            searchLocationBar.searchTextField.trailingAnchor.constraint(equalTo: searchLocationBar.trailingAnchor),
            searchLocationBar.searchTextField.bottomAnchor.constraint(equalTo: searchLocationBar.bottomAnchor),
            
            //MARK: recentlySearchLocationCollectionView
            recentlySearchLocationCollectionView.topAnchor.constraint(equalTo: searchLocationBar.bottomAnchor, constant: 1.5*baseOffseats),
            recentlySearchLocationCollectionView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: baseOffseats),
            recentlySearchLocationCollectionView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -baseOffseats),
            recentlySearchLocationCollectionView.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -baseOffseats)

        ])
        
    }
    
    
    //MARK: - Network
    
    private func fetchCurrentLocation(){
        

        if let savedData = UserDefaults.standard.data(forKey: "FirstCurrentLocation") {
            if let loadedArray = try? JSONDecoder().decode([CurrentWeatherModel].self, from: savedData) {
                self.currentLocationArray = loadedArray
                self.recentlySearchLocationCollectionView.reloadData()

            } else {
                print("Ошибка при распаковке данных из UserDefaults in ManageLocation")
            }
        } else {
            print("Данные отсутствуют в UserDefaults.")
        }
        
        
        
        if let savedData = UserDefaults.standard.data(forKey: "RecentLocationArray") {
            if let loadedArray = try? JSONDecoder().decode([CurrentWeatherModel].self, from: savedData) {
                self.recentLocationArray = loadedArray
                self.recentlySearchLocationCollectionView.reloadData()
                
            } else {
                print("Ошибка при распаковке данных из UserDefaults.")
            }
        }

        
        self.recentlySearchLocationCollectionView.reloadData()
    }

    
    private func fetchDataAboutAnotherLocation() {
        
        
        
        NetworkManager.shared.fetchCurrentWeather { CurrentWeather in

            
            if self.currentLocationArray.isEmpty {

                
                self.fetchCurrentLocation()
                
                
            } else {
                
                
                let hasMatchingNameInCurrentLocation = self.currentLocationArray.contains { objc in
                    
                    
                    return objc.location?.name == CurrentWeather.location?.name
                    
                }
                
                let hasMatchingNameInRecentlyLocation = self.recentLocationArray.contains { objc in
                    
                    
                    return objc.location?.name == CurrentWeather.location?.name
                    
                }
                
                if !hasMatchingNameInCurrentLocation && !hasMatchingNameInRecentlyLocation {
                    
                    self.recentLocationArray.append(CurrentWeather)
                    
                    self.showAlert(title: "Added!".localized(), message: "Go to the main screen or click on the required cell".localized())
                    
                    if let encodedData = try? JSONEncoder().encode(self.recentLocationArray) {
                        UserDefaults.standard.set(encodedData, forKey: "RecentLocationArray")
                        UserDefaults.standard.synchronize()
                        
                    } else {
                        print("Ошибка при кодировании данных.")
                    }
                    
                    
                }else{
                    
                    
                    
                    
                }
                
            }
            
            DispatchQueue.main.async {
                self.recentlySearchLocationCollectionView.reloadData()
            }
        }
        
    }
    
    private func navigationToMainView() {
        
        let transition = CATransition()
        transition.duration = 0.2
        transition.type = .push
        transition.subtype = .fromRight

        navigationController?.view.layer.add(transition, forKey: kCATransition)
        navigationController?.popViewController(animated: false)
    }
    
    //MARK: Alert
    private func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        fetchDataAboutAnotherLocation()
        recentlySearchLocationCollectionView.reloadData()
        
    }
    
    //MARK: Objc func
    
    @objc func backToMainView() {
        
        navigationToMainView()
        
    }
    
    @objc func resetRecentLocation() {
        
        let alertController = UIAlertController(title: "Clear?", message: "Want to clear all recent locations?", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Yes", style: .default) { _ in
            
            UserDefaults.standard.removeObject(forKey: "RecentLocationArray")
            UserDefaults.standard.synchronize()
            self.recentLocationArray.removeAll()
            
            DispatchQueue.main.async {
                self.recentlySearchLocationCollectionView.reloadData()
            }
            
        }
        
        let cancelAction = UIAlertAction(title: "No", style: .cancel)
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)

        

    }
    
}



//MARK: - UICollectionViewDelegate

extension ManageLocationViewController: UICollectionViewDelegate {
    
    
}

//MARK: - UICollectionViewDelegate

extension ManageLocationViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        navigationToMainView()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return currentLocationArray.count + recentLocationArray.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CurrentLocationCollectionViewCell.cellId, for: indexPath) as? CurrentLocationCollectionViewCell
        cell?.layer.cornerRadius = 20

        
        if indexPath.row == 0 {
            
            cell?.weatherOfCurrentLocationImageView.isHidden = false
            cell?.configureCell(model: currentLocationArray[0])
            
        }else{
            
            cell?.configureCell(model: recentLocationArray[indexPath.row - 1])
        

        }
        
        
        return cell!
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension ManageLocationViewController: UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: backgroundView.frame.width - 2*20, height: backgroundView.frame.height / 7) 
    }

}


//MARK: - UISearchBarDelegate

extension ManageLocationViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        if let searchText = searchBar.text, !searchText.isEmpty {
            NetworkManager.shared.checkAPIStatus(apiKeyword: searchText) { result in
                
                switch result {
                case .success(1):
                    DispatchQueue.main.async {
                        
                        self.fetchDataAboutAnotherLocation()

                        self.recentlySearchLocationCollectionView.reloadData()
                    }
                    
                default:

                    self.showAlert(title: "Error", message: "Check correct data or now region not available".localized())
                }
            }

        }
    }
    
}
