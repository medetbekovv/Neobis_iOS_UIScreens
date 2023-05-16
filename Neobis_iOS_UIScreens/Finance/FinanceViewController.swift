//
//  FinanceViewController.swift
//  Neobis_iOS_UIScreens
//
//  Created by user on 16/5/23.
//

import UIKit
import SnapKit

class FinanceViewController: UIViewController {
    
    let financeView = FinanceView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(financeView)
        financeView.snp.makeConstraints { make in
            make.size.equalToSuperview()
        }
    }
}
