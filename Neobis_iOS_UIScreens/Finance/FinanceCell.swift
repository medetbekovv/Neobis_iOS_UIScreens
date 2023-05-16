//
//  FinanceCell.swift
//  Neobis_iOS_UIScreens
//
//  Created by user on 16/5/23.
//

import UIKit
import SnapKit

class FinanceCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .purple
        iv.snp.makeConstraints { make in
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
        iv.layer.cornerRadius = 15
        iv.contentMode = .center
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont(name: "Inter-Medium", size: 16)
        label.text = "Дом"
        return label
    }()
    
    let moneyLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont(name: "Inter-Bold", size: 14)
        label.textAlignment = .right
        label.text = "$321"
        return label
    }()
    
    let spentOnLabel: UILabel = {
        let label = UILabel()
        label.alpha = 0.5
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont(name: "Inter-Regular", size: 14)
        label.textAlignment = .right
        label.text = "Продукты"
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
        
        let leftStackView = UIStackView(arrangedSubviews: [imageView, nameLabel])
        leftStackView.spacing = 15
        leftStackView.axis = .horizontal
        
        addSubview(leftStackView)
        leftStackView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
        }
        
        let rightStackView = UIStackView(arrangedSubviews: [moneyLabel, spentOnLabel])
        rightStackView.axis = .vertical
        
        addSubview(rightStackView)
        rightStackView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-16)
        }
        
        addSubview(separatorView)
        separatorView.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.leading.equalTo(nameLabel.snp.leading)
            make.trailing.equalTo(rightStackView.snp.trailing)
            make.bottom.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
