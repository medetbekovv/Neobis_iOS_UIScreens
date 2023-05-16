//
//  TravelCell.swift
//  Neobis_iOS_UIScreens
//
//  Created by user on 16/5/23.
//

import UIKit

class TravelCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
       let iv = UIImageView()
        iv.image = UIImage(named: "Abu-Dhabi")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        layer.cornerRadius = 10
        
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.size.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
