//
//  WeatherViewController.swift
//  Neobis_iOS_UIScreens
//
//  Created by user on 16/5/23.
//

import UIKit
import SnapKit

class WeatherViewController: UIViewController {
    
    private lazy var leftImageView : UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "Vector 12")
        return view
    }()
    
    private lazy var rightImageView : UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "Vector 11")
        return view
    }()
    
    private lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = .systemFont(ofSize: 24)
        //  label.font = UIFont(name: "Overpass-Bold", size: 24)
        label.text = "Бишкек"
        label.addShadow1()
        return label
    }()
    
    private lazy var locationView : UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "locator")
        return view
    }()
    
    private lazy var alertButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "notification"), for: .normal)
        return button
    }()
    
    private lazy var sunImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "sun")
        return view
    }()
    
    private lazy var sunBackImageView : UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "sun-background")
        return view
    }()
    
    
    private lazy var infoView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        view.layer.borderColor = UIColor(red: 196/255, green: 222/255, blue: 238/255, alpha: 1.0).cgColor
        view.layer.borderWidth = 0.9
        view.layer.cornerRadius = 15
        return view
    }()
    
    private lazy var dataLabel : UILabel = {
        let label = UILabel()
        label.text = "Сегодня, 26 Апрель"
        label.font = .systemFont(ofSize: 18)
        //    label.font = UIFont(name: "Overpass-Regular", size: 18)
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        return label
    }()
    
    private lazy var temperatureLabel : UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = .systemFont(ofSize: 100)
        label.font = .init(name: "Overpass-Regular" , size: 100)
        // label.font = UIFont(name: "Overpass-Regular")
        label.font = .systemFont(ofSize: 100)
        
        label.text = " 22°"
        label.addShadow2()
        return label
    }()
    
    private lazy var weatherConditionLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = .systemFont(ofSize: 24)
        //       label.font = UIFont(name: "Overpass-Bold", size: 24)
        label.text = "Солнечно"
        label.addShadow1()
        return label
    }()
    
    private lazy var windImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "wind")
        view.addShadow()
        return view
    }()
    
    private lazy var rainImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "rain")
        view.addShadow()
        return view
    }()
    
    private lazy var windLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = .systemFont(ofSize: 18)
        //    label.font = UIFont(name: "Overpass-Regular", size: 18)
        label.text = "Ветер"
        label.addShadow1()
        return label
    }()
    
    private lazy var rainLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = .systemFont(ofSize: 18)
        //       label.font = UIFont(name: "Overpass-Regular", size: 18)
        label.text = "Дождь"
        label.addShadow1()
        return label
    }()
    
    private lazy var separatorLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = .systemFont(ofSize: 18)
        //    label.font = UIFont(name: "Raleway-Light", size: 18)
        label.text = "|"
        label.addShadow1()
        return label
    }()
    
    private lazy var separatorLabel2: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = .systemFont(ofSize: 18)
        //    label.font = UIFont(name: "Raleway-Light", size: 18)
        label.text = "|"
        label.addShadow1()
        return label
    }()
    
    private lazy var windSpeedLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        //     label.font = UIFont(name: "Overpass-Regular", size: 18)
        label.font = .systemFont(ofSize: 18)
        label.text = "15 km/h"
        label.addShadow1()
        return label
    }()
    
    private lazy var rainSpeedLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "Overpass-Regular", size: 18)
        label.text = "26 %"
        label.addShadow1()
        return label
    }()
    
    private lazy var downButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "down"), for: .normal)
        return button
    }()
    
    private lazy var weekButton : UIButton = {
        let button = UIButton(type: .system)
        
        
        button.setTitle("Прогноз на неделю", for: .normal)
        button.titleLabel?.font = UIFont(name: "Overpass-Regular", size: 16)
        button.setImage(UIImage(named: "up"), for: .normal)
        button.tintColor = UIColor(red: 0.267, green: 0.306, blue: 0.446, alpha: 1)
        button.semanticContentAttribute = .forceRightToLeft
        button.backgroundColor = .white
        button.layer.cornerRadius = 20
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 74/255, green: 145/255, blue: 255/255, alpha: 1)
        setupViews()
    }
    
    fileprivate func setupViews() {
        view.addSubview(leftImageView)
        leftImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalToSuperview().offset(flexibleWidth(to: 92))
        }
        
        
        view.addSubview(rightImageView)
        rightImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(flexibleHeight(to: 10))
            make.trailing.equalToSuperview().offset(flexibleWidth(to: 59))
            
        }
        
        view.addSubview(locationView)
        locationView.snp.makeConstraints { make in
            make.width.equalTo(21.73)
            make.height.equalTo(20)
            make.top.equalToSuperview().offset(flexibleHeight(to: 61))
            make.leading.equalToSuperview().offset(flexibleWidth(to: 34))
        }
        
        view.addSubview(locationLabel)
        locationLabel.snp.makeConstraints { make in
            make.height.equalTo(37)
            make.width.equalTo(100)
            make.top.equalToSuperview().offset(flexibleHeight(to: 52))
            make.leading.equalTo(leftImageView.snp.trailing).offset(flexibleWidth(to: -23))
        }
        
        view.addSubview(downButton)
        downButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(flexibleHeight(to: 61))
            make.leading.equalTo(locationLabel.snp.trailing).offset(flexibleWidth(to: 36.76))
        }
        
        view.addSubview(alertButton)
        alertButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(flexibleHeight(to: 61))
            make.leading.equalTo(downButton.snp.trailing).offset(flexibleWidth(to:140))
        }
        
        view.addSubview(sunBackImageView)
        sunBackImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(flexibleHeight(to: 72))
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(sunImageView)
        sunImageView.snp.makeConstraints { make in
            make.center.equalTo(sunBackImageView.snp.center)
        }
        
        view.addSubview(infoView)
        infoView.snp.makeConstraints { make in
            make.width.equalTo(353)
            make.height.equalTo(335)
            make.leading.equalToSuperview().offset(flexibleWidth(to: 31))
            make.trailing.equalToSuperview().offset(flexibleWidth(to: -30))
            make.bottom.equalToSuperview().offset(flexibleHeight(to: -200))
        }
        
        infoView.addSubview(dataLabel)
        dataLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(flexibleHeight(to: 17))
            make.centerX.equalToSuperview()
        }
        
        infoView.addSubview(temperatureLabel)
        temperatureLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(31)
            make.centerX.equalToSuperview()
        }
        
        infoView.addSubview(weatherConditionLabel)
        weatherConditionLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(flexibleHeight(to: 168))
            make.centerX.equalToSuperview()
        }
        
        infoView.addSubview(windImageView)
        windImageView.snp.makeConstraints { make in
            make.top.equalTo(weatherConditionLabel.snp.bottom).offset(flexibleHeight(to: 36))
            make.leading.equalToSuperview().offset(69)
        }
        
        infoView.addSubview(rainImageView)
        rainImageView.snp.makeConstraints { make in
            make.top.equalTo(windImageView.snp.bottom).offset(22.27)
            make.leading.equalToSuperview().offset(70)
        }
        
        infoView.addSubview(windLabel)
        windLabel.snp.makeConstraints { make in
            make.top.equalTo(weatherConditionLabel.snp.bottom).offset(32)
            make.leading.equalTo(windImageView.snp.trailing).offset(22)
        }
        
        infoView.addSubview(rainLabel)
        rainLabel.snp.makeConstraints { make in
            make.leading.equalTo(rainImageView.snp.trailing).offset(23)
            make.top.equalTo(windLabel.snp.bottom).offset(16)
        }
        
        infoView.addSubview(separatorLabel)
        separatorLabel.snp.makeConstraints { make in
            make.leading.equalTo(rainLabel.snp.trailing).offset(11)
            make.top.equalTo(weatherConditionLabel.snp.bottom).offset(flexibleHeight(to: 35))
        }
        
        infoView.addSubview(separatorLabel2)
        separatorLabel2.snp.makeConstraints { make in
            make.top.equalTo(weatherConditionLabel.snp.bottom).offset(72)
            make.leading.equalToSuperview().offset(179)

        }
        
        infoView.addSubview(windSpeedLabel)
        windSpeedLabel.snp.makeConstraints { make in
            make.top.equalTo(windImageView.snp.top)
            make.leading.equalTo(separatorLabel.snp.trailing).offset(20)
        }
        
        infoView.addSubview(rainSpeedLabel)
        rainSpeedLabel.snp.makeConstraints { make in
            make.top.equalTo(windSpeedLabel.snp.bottom).offset(16)
            make.leading.equalTo(separatorLabel2.snp.trailing).offset(20)
        }
        
        view.addSubview(weekButton)
        weekButton.snp.makeConstraints { make in
            make.height.equalTo(64)
            make.width.equalTo(249)
            make.top.equalTo(infoView.snp.bottom).offset(100)
            make.bottom.equalToSuperview().offset(flexibleHeight(to: -36))
            make.trailing.equalToSuperview().offset(flexibleWidth(to: -82))
            make.leading.equalToSuperview().offset(flexibleWidth(to: 83))
        }
        weekButton.addTarget(self, action: #selector(weekButtonTapped), for: .touchUpInside)
    }
    @objc private func weekButtonTapped() {
        let vc = WeatherWeekViewController()
        present(vc, animated: true)
    }
}
