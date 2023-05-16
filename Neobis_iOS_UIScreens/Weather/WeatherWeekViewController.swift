//
//  WeatherWeekViewController.swift
//  Neobis_iOS_UIScreens
//
//  Created by user on 16/5/23.
//

import UIKit
import SnapKit

class WeatherWeekViewController: UIViewController {
    
    let weatherWeekView = WeatherWeekView()
    
    override func viewDidLoad() {
        super .viewDidLoad()
        
        view.addSubview(weatherWeekView)
        weatherWeekView.snp.makeConstraints { make in
            make.size.equalToSuperview()
        }
        gradient()
        weatherWeekView.backButton.addTarget(self, action: #selector(handleBack), for: .touchUpInside)
    }
    
    func gradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        gradientLayer.colors = [UIColor(red: 70/255, green: 188/255, blue: 225/255, alpha: 1).cgColor,UIColor(red: 73/255, green: 173/255, blue: 236/255, alpha: 1).cgColor,UIColor(red: 74/255, green: 153/255, blue: 249/255, alpha: 1).cgColor]
        gradientLayer.locations = [0.0, 0.5, 1.0]
        
        let animation = CABasicAnimation(keyPath: "colors")
        animation.fromValue = [UIColor(red: 70/255, green: 188/255, blue: 225/255, alpha: 1).cgColor,UIColor(red: 73/255, green: 173/255, blue: 236/255, alpha: 1).cgColor,UIColor(red: 74/255, green: 153/255, blue: 249/255, alpha: 1).cgColor]
        animation.toValue = [UIColor(red: 74/255, green: 153/255, blue: 249/255, alpha: 1).cgColor,UIColor(red: 73/255, green: 173/255, blue: 236/255, alpha: 1).cgColor,UIColor(red: 70/255, green: 188/255, blue: 225/255, alpha: 1).cgColor]
        animation.duration = 3.0
        animation.autoreverses = true
        animation.repeatCount = .infinity
        gradientLayer.add(animation, forKey: nil)
    }
    
    @objc func handleBack() {
        self.dismiss(animated: true)
    }
    
}

class WeatherWeekView: UIView {
    
    let leftImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "Vector 12")
        return iv
    }()
    
    let rightImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "Vector 11")
        return iv
    }()
    
    var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "left"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    var backLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "Overpass-SemiBold", size: 24)
        label.text = "Назад"
        label.addShadow1()
        return label
    }()
    
    var settingsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "настройки"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "Overpass-Regular", size: 18)
        label.text = "AccuWeather"
        label.addShadow1()
        return label
    }()
    
    var titleImageView: UIImageView = {
       let iv = UIImageView()
        iv.image = UIImage(named: "Солнце")
        return iv
    }()
    
    var todayLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "Overpass-SemiBold", size: 24)
        label.text = "Сегодня"
        label.addShadow1()
        return label
    }()
    
    var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "Overpass-Regular", size: 18)
        label.text = "Апр, 26"
        label.addShadow1()
        return label
    }()
    
    let middleCollectionViewController = WeatherMiddleCollectionViewController()
    
    var thisWeekLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "Overpass-SemiBold", size: 24)
        label.text = "На этой неделе"
        label.addShadow1()
        return label
    }()
    
    var calendarImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "Календарь")
        iv.addShadow()
        return iv
    }()
    
    let bottomCollectionViewController = WeatherBottomCollectionViewController()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupViews()
    }
        
    fileprivate func setupViews() {
        
        addSubview(leftImageView)
        leftImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalToSuperview().offset(flexibleHeight(to: 100))
        }
        
        addSubview(rightImageView)
        rightImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(-(flexibleHeight(to: 30)))
            make.trailing.equalToSuperview().offset(flexibleWidth(to: 50))
        }
        
        addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(flexibleHeight(to: 70))
            make.leading.equalToSuperview().offset(flexibleWidth(to: 35))
        }
        
        addSubview(backLabel)
        backLabel.snp.makeConstraints { make in
            make.top.equalTo(backButton.snp.top).offset(-6)
            make.leading.equalTo(backButton.snp.trailing).offset(10)
        }
        
        addSubview(settingsButton)
        settingsButton.snp.makeConstraints { make in
            make.top.equalTo(backButton.snp.top).offset(2)
            make.trailing.equalToSuperview().offset(-(flexibleWidth(to: 35)))
        }
        addSubview(todayLabel)
        todayLabel.snp.makeConstraints { make in
            make.top.equalTo(backLabel.snp.bottom).offset(flexibleHeight(to: 50))
            make.leading.equalTo(backButton.snp.leading)
        }
        addSubview(dateLabel)
        dateLabel.snp.makeConstraints { make in
            make.trailing.equalTo(settingsButton.snp.trailing)
            make.top.equalTo(todayLabel.snp.top)
        }
        
        addSubview(middleCollectionViewController.collectionView)
        middleCollectionViewController.collectionView.snp.makeConstraints { make in
            make.top.equalTo(todayLabel.snp.bottom).offset(flexibleHeight(to: 20))
            make.width.equalTo(frame.width)
            make.height.equalTo(flexibleHeight(to: 185))
        }
        addSubview(thisWeekLabel)
        thisWeekLabel.snp.makeConstraints { make in
            make.top.equalTo(middleCollectionViewController.collectionView.snp.bottom).offset(flexibleHeight(to: 20))
            make.leading.equalTo(todayLabel.snp.leading)
        }
        addSubview(calendarImageView)
        calendarImageView.snp.makeConstraints { make in
            make.top.equalTo(thisWeekLabel.snp.top)
            make.trailing.equalTo(settingsButton.snp.trailing)
        }
        addSubview(bottomCollectionViewController.collectionView)
        bottomCollectionViewController.collectionView.snp.makeConstraints { make in
            make.top.equalTo(thisWeekLabel.snp.bottom).offset(flexibleHeight(to: 20))
            make.width.equalTo(frame.width)
            make.height.equalTo(flexibleHeight(to: 400))
        }
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-25)
            make.trailing.equalToSuperview().offset(-130)
        }
        addSubview(titleImageView)
        titleImageView.snp.makeConstraints { make in
            make.bottom.equalTo(titleLabel.snp.bottom).offset(-3)
            make.trailing.equalTo(titleLabel.snp.leading).offset(-10)
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
