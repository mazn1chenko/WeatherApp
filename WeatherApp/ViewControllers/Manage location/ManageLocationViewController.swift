//
//  ManageLocationViewController.swift
//  WeatherApp
//
//  Created by m223 on 07.10.2023.
//

import Foundation
import UIKit

final class ManageLocationViewController: UIViewController {
    
    let backgroundView = UIView()
    
    let titleLabel = UILabel()
        
    let searchLocationBar = UISearchBar()
    
    let customBackButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.hidesBackButton = true

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
        titleLabel.text = "Manage location".localized()
        titleLabel.font = UIFont(name: "Puppies-SemiBold", size: 24)
        
        customBackButton.translatesAutoresizingMaskIntoConstraints = false
        customBackButton.setImage(UIImage(named: "bi_arrow-left-short"), for: .normal)
        customBackButton.tintColor = .white
        customBackButton.addTarget(self, action: #selector(backToMainView), for: .touchUpInside)
        
//        searchLocationSearchBarController.view = searchLocationBar
        searchLocationBar.translatesAutoresizingMaskIntoConstraints = false
        searchLocationBar.placeholder = "Search Your City".localized()
        searchLocationBar.delegate = self
        searchLocationBar.barTintColor = .backgroundOfView
        searchLocationBar.layer.cornerRadius = 20
        searchLocationBar.searchBarStyle = .minimal
        


    }
    //MARK: - setupLayouts
    
    private func setupLayouts() {
        view.addSubview(backgroundView)
        backgroundView.addSubview(customBackButton)
        backgroundView.addSubview(searchLocationBar)
        backgroundView.addSubview(titleLabel)
        
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

        ])
        
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
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
}

extension ManageLocationViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        if let searchText = searchBar.text, !searchText.isEmpty {
            print(searchText)
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
