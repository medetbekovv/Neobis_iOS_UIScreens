//
//  CryptoCell.swift
//  Neobis_iOS_UIScreens
//
//  Created by user on 16/5/23.
//

import UIKit
import SnapKit

class CryptoCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .purple
        iv.snp.makeConstraints { make in
            make.width.equalTo(56)
            make.height.equalTo(56)
        }
        iv.layer.cornerRadius = 20
        iv.contentMode = .center
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.09, green: 0.09, blue: 0.102, alpha: 1)
        label.font = UIFont(name: "SegoeUI-Semibold", size: 24)
        return label
    }()
    
    let changeLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.684, green: 0.715, blue: 0.808, alpha: 1)
        label.font = UIFont(name: "Segoe UI", size: 12)
        return label
    }()
    
    let priceUsdLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.09, green: 0.09, blue: 0.102, alpha: 1)
        label.font = UIFont(name: "SegoeUI-Semibold", size: 16)
        label.textAlignment = .right
        return label
    }()
    
    let priceBtcLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.684, green: 0.715, blue: 0.808, alpha: 1)
        label.font = UIFont(name: "Segoe UI", size: 12)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1
        label.textAlignment = .right
        return label
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.908, green: 0.908, blue: 0.908, alpha: 1)
        return view
    }()
    
    
    override init(frame: CGRect) {
        super .init(frame: frame)

        setupViews()
        
    }
    
    fileprivate func setupViews() {
        
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        let nameStackView = UIStackView(arrangedSubviews: [nameLabel, changeLabel])
        nameStackView.axis = .vertical
        addSubview(nameStackView)
        nameStackView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(imageView.snp.trailing).offset(12)
        }
        
        let priceStackView = UIStackView(arrangedSubviews: [priceUsdLabel, priceBtcLabel])
        priceStackView.axis = .vertical
        priceStackView.alignment = .trailing
        addSubview(priceStackView)
        priceStackView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        addSubview(separatorView)
        separatorView.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.top.equalTo(imageView.snp.bottom).offset(16)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
