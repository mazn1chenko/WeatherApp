//
//  SettingsViewController.swift
//  WeatherApp
//
//  Created by m223 on 06.10.2023.
//

import Foundation
import UIKit


final class SettingsViewController: UIViewController {
    
    private let backgroundView = UIView()
    
    //MARK: Buttons
    private let customBackButton = UIButton(type: .system)
    private let aboutButton = UIButton(type: .system)
    private let privacyPolicyButton = UIButton(type: .system)
    
    //MARK: Labels
    private let titleLabel = UILabel()
    private let unitLabel = UILabel()
    private let extraLabel = UILabel()
    
    //MARK: Language
    private let languageLabel = UILabel()
    private let languageSegmentControl = UISegmentedControl(items: ["ENG", "UA"])
    private var selectedLanguageIndex = 0
    
    //MARK: settingsLabelStackView
    private let settingsLabelStackView = UIStackView()
    private let temperatureUnitLabel = UILabel()
    private let windSpeedUnitLabel = UILabel()
    private let atmosphericPressureUnitLabel = UILabel()
    
    //MARK: settingsSegmentControlStackView
    private let settingsSegmentControlStackView = UIStackView()
    private let temperatureUnitSegmentControl = UISegmentedControl(items: ["C°", "°F"])
    private let windSpeedUnitSegmentControl = UISegmentedControl(items: ["km/h", "mil/h"])
    private let atmosphericPressureUnitSegmentControl = UISegmentedControl(items: ["mbar", "atm"])

    private let separator = UIView()
    
    //MARK: - viewDidLoad
    
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
        
        //MARK: Buttons
        customBackButton.translatesAutoresizingMaskIntoConstraints = false
        customBackButton.setImage(UIImage(named: "bi_arrow-left-short"), for: .normal)
        customBackButton.tintColor = .white
        customBackButton.addTarget(self, action: #selector(backToMainView), for: .touchUpInside)

        aboutButton.translatesAutoresizingMaskIntoConstraints = false
        aboutButton.setTitle("About", for: .normal)
        aboutButton.tintColor = .white
        aboutButton.addTarget(self, action: #selector(tapAboutButton), for: .touchUpInside)

        privacyPolicyButton.translatesAutoresizingMaskIntoConstraints = false
        privacyPolicyButton.setTitle("Privacy policy", for: .normal)
        privacyPolicyButton.tintColor = .white
        privacyPolicyButton.addTarget(self, action: #selector(tapPrivacyButton), for: .touchUpInside)
        
        //MARK: Labels
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Settings".localized()
        titleLabel.font = UIFont(name: "Puppies-SemiBold", size: 24)
        
        unitLabel.translatesAutoresizingMaskIntoConstraints = false
        unitLabel.text = "UNIT".localized()
        unitLabel.font = UIFont(name: "Puppies-Medium", size: 16)
        unitLabel.textAlignment = .left
        
        
        extraLabel.translatesAutoresizingMaskIntoConstraints = false
        extraLabel.text = "EXTRA"
        extraLabel.font = UIFont(name: "Puppies-Medium", size: 16)
        extraLabel.textAlignment = .left
        
        //MARK: Language
        languageLabel.translatesAutoresizingMaskIntoConstraints = false
        languageLabel.text = "Language".localized()
        languageLabel.font = UIFont(name: "Puppies-Medium", size: 14)
        languageLabel.textAlignment = .left

        languageSegmentControl.translatesAutoresizingMaskIntoConstraints = false
        languageSegmentControl.addTarget(self, action: #selector(changeLang), for: .allEvents)
        if let savedLanguageIndex = UserDefaults.standard.value(forKey: "SelectedLanguageIndex") as? Int {
            selectedLanguageIndex = savedLanguageIndex
        }
        languageSegmentControl.selectedSegmentIndex = selectedLanguageIndex


        
        settingsLabelStackView.translatesAutoresizingMaskIntoConstraints = false
        settingsLabelStackView.axis = .vertical
        settingsLabelStackView.distribution = .fillEqually
        
        temperatureUnitLabel.text = "Temperature unit".localized()
        temperatureUnitLabel.textColor = .white
        temperatureUnitLabel.font = UIFont(name: "Puppies-Medium", size: 14)
        
        atmosphericPressureUnitLabel.text = "Atmospheric pressure unit".localized()
        atmosphericPressureUnitLabel.textColor = .white
        atmosphericPressureUnitLabel.font = UIFont(name: "Puppies-Medium", size: 14)

        
        windSpeedUnitLabel.text = "Wind speed unit".localized()
        windSpeedUnitLabel.textColor = .white
        windSpeedUnitLabel.font = UIFont(name: "Puppies-Medium", size: 14)

        
        settingsSegmentControlStackView.translatesAutoresizingMaskIntoConstraints = false
        settingsSegmentControlStackView.axis = .vertical
        settingsSegmentControlStackView.distribution = .fillEqually
        settingsSegmentControlStackView.alignment = .trailing
        
        temperatureUnitSegmentControl.selectedSegmentIndex = 0
        windSpeedUnitSegmentControl.selectedSegmentIndex = 0
        atmosphericPressureUnitSegmentControl.selectedSegmentIndex = 0

        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.backgroundColor = .white
        
    }
    
    //MARK: - setupLayouts

    private func setupLayouts() {
        view.addSubview(backgroundView)
        
        backgroundView.addSubview(customBackButton)
        backgroundView.addSubview(aboutButton)
        backgroundView.addSubview(privacyPolicyButton)
        
        backgroundView.addSubview(titleLabel)
        backgroundView.addSubview(unitLabel)
        backgroundView.addSubview(extraLabel)
        
        //MARK: Language layout
        backgroundView.addSubview(languageLabel)
        backgroundView.addSubview(languageSegmentControl)
        
        //MARK: settingsLabelStackView layout
        backgroundView.addSubview(settingsLabelStackView)
        settingsLabelStackView.addArrangedSubview(temperatureUnitLabel)
        settingsLabelStackView.addArrangedSubview(atmosphericPressureUnitLabel)
        settingsLabelStackView.addArrangedSubview(windSpeedUnitLabel)
        
        //MARK: settingsSegmentControlStackView layout
        backgroundView.addSubview(settingsSegmentControlStackView)
        settingsSegmentControlStackView.addArrangedSubview(temperatureUnitSegmentControl)
        settingsSegmentControlStackView.addArrangedSubview(atmosphericPressureUnitSegmentControl)
        settingsSegmentControlStackView.addArrangedSubview(windSpeedUnitSegmentControl)
        
        backgroundView.addSubview(separator)
        
        let baseOffseats: CGFloat = 20
        
        NSLayoutConstraint.activate([
            
            backgroundView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            backgroundView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            backgroundView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            //MARK: Button`s Layouts
            customBackButton.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 15),
            customBackButton.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: baseOffseats),
            customBackButton.heightAnchor.constraint(equalToConstant: 32),
            customBackButton.widthAnchor.constraint(equalToConstant: 32),
            
            aboutButton.topAnchor.constraint(equalTo: languageLabel.bottomAnchor, constant: 20),
            aboutButton.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: baseOffseats),
            
            privacyPolicyButton.topAnchor.constraint(equalTo: aboutButton.bottomAnchor, constant: 20),
            privacyPolicyButton.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: baseOffseats),
            
            //MARK: Label`s Layout
            titleLabel.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 15),
            titleLabel.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            
            unitLabel.topAnchor.constraint(equalTo: customBackButton.bottomAnchor, constant: 40),
            unitLabel.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: baseOffseats),
            unitLabel.heightAnchor.constraint(equalToConstant: 30),
            unitLabel.widthAnchor.constraint(equalToConstant: 350),
            
            extraLabel.topAnchor.constraint(equalTo: separator.bottomAnchor, constant: 20),
            extraLabel.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: baseOffseats),
            extraLabel.heightAnchor.constraint(equalToConstant: 30),
            extraLabel.widthAnchor.constraint(equalToConstant: 100),

            //MARK: Language Layout
            languageLabel.topAnchor.constraint(equalTo: extraLabel.bottomAnchor, constant: 20),
            languageLabel.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: baseOffseats),
            
            languageSegmentControl.centerYAnchor.constraint(equalTo: languageLabel.centerYAnchor),
            languageSegmentControl.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -baseOffseats),
            
            
            //MARK: settingsLabelStackView`s Layout
            settingsLabelStackView.topAnchor.constraint(equalTo: unitLabel.bottomAnchor, constant: 15),
            settingsLabelStackView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: baseOffseats),
            settingsLabelStackView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -(baseOffseats)),
            settingsLabelStackView.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -(view.frame.height * 0.6)),
            
            //MARK: settingsSegmentControlStackView`s Layout
            settingsSegmentControlStackView.topAnchor.constraint(equalTo: unitLabel.bottomAnchor, constant: 15),
            settingsSegmentControlStackView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: baseOffseats),
            settingsSegmentControlStackView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -(baseOffseats)),
            settingsSegmentControlStackView.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -(view.frame.height * 0.6)),
            
            //MARK: Separator`s Layout
            separator.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            separator.topAnchor.constraint(equalTo: settingsSegmentControlStackView.bottomAnchor, constant: 25),
            separator.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: baseOffseats),
            separator.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -(baseOffseats)),
            separator.heightAnchor.constraint(equalToConstant: 1),
                        
            
            
        ])
        
    }
    
    //MARK: - Enother func
    
    private func setAppLanguage(languageCode: String) {
        UserDefaults.standard.set(languageCode, forKey: "AppLanguage")
        UserDefaults.standard.synchronize()
        
        showInfoAboutChangeLanguage()
        
    }
    
    private func showInfoAboutChangeLanguage() {
        let alert = UIAlertController(title: "Done!".localized(),
                                      message: "When restarting the application - the language will be changed".localized(),
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
        }
        
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    
    //MARK: - Objc func/target func
    
    @objc func backToMainView() {
        
        navigationController?.popViewController(animated: true)
    }
    
    @objc func tapAboutButton() {
        
    }
    
    @objc func tapPrivacyButton() {
        
        
    }
    
    @objc func changeLang(_ sender: UISegmentedControl) {
        
        selectedLanguageIndex = sender.selectedSegmentIndex
        UserDefaults.standard.set(selectedLanguageIndex, forKey: "SelectedLanguageIndex")
        UserDefaults.standard.synchronize()
        
        switch sender.selectedSegmentIndex {
        case 0:
            setAppLanguage(languageCode: "en")
        case 1:
            setAppLanguage(languageCode: "uk")

        default:
            break
        }
        
    }
    
    
}
