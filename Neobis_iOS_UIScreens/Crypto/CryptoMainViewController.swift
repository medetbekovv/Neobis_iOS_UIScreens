//
//  CryptoMainViewController.swift
//  Neobis_iOS_UIScreens
//
//  Created by user on 16/5/23.
//

import UIKit
import SnapKit

class CryptoMainViewController: UIViewController {
    
    let mainView = CryptoMainView()
    
    override func viewDidLoad() {
        super .viewDidLoad()
        
        view.addSubview(mainView)
        mainView.snp.makeConstraints { make in
            make.size.equalToSuperview()
        }
    }
}
