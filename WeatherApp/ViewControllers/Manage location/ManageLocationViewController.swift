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
    
    var recentLocationArray = [CurrentWeatherModel]()
                
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.hidesBackButton = true

        setupViews()
        setupLayouts()
        fetchCurrentLocationWeather()
                
    }
    
    //MARK: - Functions setupViews and setupLayouts

    //MARK: setupViews

    private func setupViews() {
        
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.backgroundColor = .backgroundOfView
        backgroundView.layer.cornerRadius = 20
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Manage location".localized()
        titleLabel.font = UIFont(name: "Poppins-SemiBold", size: 24)
        
        customBackButton.translatesAutoresizingMaskIntoConstraints = false
        customBackButton.setImage(UIImage(named: "bi_arrow-left-short"), for: .normal)
        customBackButton.tintColor = .white
        customBackButton.addTarget(self, action: #selector(backToMainView), for: .touchUpInside)
        
        searchLocationBar.translatesAutoresizingMaskIntoConstraints = false
        searchLocationBar.placeholder = "Search Your City".localized()
        searchLocationBar.delegate = self
        searchLocationBar.barTintColor = .backgroundOfView
        searchLocationBar.layer.cornerRadius = 20
        searchLocationBar.searchBarStyle = .minimal
        
        recentlySearchLocationCollectionView.translatesAutoresizingMaskIntoConstraints = false
        recentlySearchLocationCollectionView.delegate = self
        recentlySearchLocationCollectionView.dataSource = self
        recentlySearchLocationCollectionView.backgroundColor = .backgroundOfView

    }
    //MARK: - setupLayouts
    
    private func setupLayouts() {
        view.addSubview(backgroundView)
        backgroundView.addSubview(customBackButton)
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
            
            searchLocationBar.topAnchor.constraint(equalTo: customBackButton.bottomAnchor, constant: 15),
            searchLocationBar.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            searchLocationBar.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: baseOffseats),
            searchLocationBar.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -baseOffseats),
            
            //MARK: recentlySearchLocationCollectionView
            recentlySearchLocationCollectionView.topAnchor.constraint(equalTo: searchLocationBar.bottomAnchor, constant: baseOffseats),
            recentlySearchLocationCollectionView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: baseOffseats),
            recentlySearchLocationCollectionView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -baseOffseats),
            recentlySearchLocationCollectionView.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -baseOffseats)

        ])
        
    }
    
    
    //MARK: - Network
    
    func fetchCurrentLocationWeather() {
        
        NetworkManager.shared.fetchCurrentWeather { CurrentWeatherModel in
            self.recentLocationArray.append(CurrentWeatherModel)
            
            DispatchQueue.main.async {
                self.recentlySearchLocationCollectionView.reloadData()
            }
        }
    }
    
    
    @objc func backToMainView() {
        
        navigationToMainView()
        
    }
    
    func navigationToMainView() {
        
        let transition = CATransition()
        transition.duration = 0.2
        transition.type = .push
        transition.subtype = .fromRight

        navigationController?.view.layer.add(transition, forKey: kCATransition)
        navigationController?.popViewController(animated: false)
    }
    
    //MARK: Alert
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        recentlySearchLocationCollectionView.reloadData()
        //?
    }
    
}



//MARK: - UICollectionViewDelegate

extension ManageLocationViewController: UICollectionViewDelegate {
    
    
}

//MARK: - UICollectionViewDelegate

extension ManageLocationViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return recentLocationArray.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CurrentLocationCollectionViewCell.cellId, for: indexPath) as? CurrentLocationCollectionViewCell
        cell?.layer.cornerRadius = 20
        if indexPath.row == 0 {
            cell?.weatherOfCurrentLocationImageView.isHidden = false
        }
        cell?.configureCell(model: recentLocationArray[indexPath.row])
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
                    self.navigationToMainView()
                default:

                    self.showAlert(title: "Error", message: "Check correct data or now region not available".localized())
                }
            }
        }
    }
}
