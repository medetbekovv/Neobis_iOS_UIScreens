//
//  FinanceFooter.swift
//  Neobis_iOS_UIScreens
//
//  Created by user on 16/5/23.
//

import UIKit
import SnapKit

class FinanceFooter: UICollectionReusableView {
    
    let moreButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("См. Еще", for: .normal)
        button.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont(name: "Inter-Regular", size: 16)
        button.snp.makeConstraints { make in
            make.width.equalTo(70)
            make.height.equalTo(20)
        }
        return button

    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
                
        addSubview(moreButton)
        moreButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
