//
//  WeatherBottomCell.swift
//  Neobis_iOS_UIScreens
//
//  Created by user on 16/5/23.
//
import UIKit

class WeatherBottomCell: UICollectionViewCell {
    
    let tempLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "Overpass-Regular", size: 18)
        label.text = "21°"
        label.addShadow1()
        return label
    }()
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "cloud")
        return iv
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "Overpass-Bold", size: 18)
        label.text = "Апр, 27"
        label.addShadow1()
        return label
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
                        
        setupViews()
    }
    
    fileprivate func setupViews() {
        
        addSubview(tempLabel)
        tempLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-20)
        }
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        addSubview(dateLabel)
        dateLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
