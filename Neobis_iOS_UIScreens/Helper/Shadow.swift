//
//  Shadow.swift
//  Neobis_iOS_UIScreens
//
//  Created by user on 16/5/23.
//

import UIKit
extension UILabel {
    func addShadow1() {
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: 0).cgPath
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 1
        self.layer.masksToBounds = false
        self.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1)
        self.shadowOffset = .init(width: -2, height: 3)
    }
    
    func addShadow2() {
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: 0).cgPath
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 50
        self.layer.masksToBounds = false
        self.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1)
        self.shadowOffset = .init(width: -4, height: 8)
    }

    static func createCustomLabel() -> UILabel {
        let label = UILabel()
        label.addShadow1()
        label.addShadow2()
        return label
    }
}

extension UIImageView{

    func addShadow() {
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 1
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        self.layer.shadowOffset = .init(width: -2, height: 3)
    }
    
    static func createCustomImageView() -> UIImageView {
        let iv = UIImageView()
        iv.addShadow()
        return iv
    }
}
