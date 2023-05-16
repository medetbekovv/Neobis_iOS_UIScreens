//
//  SinglesCollectionViewHeader.swift
//  Neobis_iOS_UIScreens
//
//  Created by user on 16/5/23.
//

import UIKit
import SnapKit

class SinglesCollectionViewHeader: UICollectionReusableView {
    
    let singlesLabel: UILabel = {
       let label = UILabel()
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont(name: "Segoe UI", size: 22)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 0.97
        label.textAlignment = .center
        label.attributedText = NSMutableAttributedString(string: "Singles", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return label
    }()
    
    let menuButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named:"menu"), for: .normal)
        button.tintColor = .black
        button.snp.makeConstraints { make in
            make.width.equalTo(20)
            make.height.equalTo(14)
        }
        return button
    }()
    
    let searchButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named:"Search"), for: .normal)
        button.tintColor = .black
        button.snp.makeConstraints { make in
            make.height.equalTo(20)
            make.width.equalTo(20)
        }
        return button
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        setupViews()
        
    }
    
    fileprivate func setupViews() {
        
        addSubview(singlesLabel)
        singlesLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        addSubview(menuButton)
        menuButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(28)
        }
        addSubview(searchButton)
        searchButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-28)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
