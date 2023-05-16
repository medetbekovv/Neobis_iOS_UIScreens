//
//  SinglesTabBarController.swift
//  Neobis_iOS_UIScreens
//
//  Created by user on 16/5/23.
//

import UIKit
import SnapKit

class SinglesTabBarController: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.tintColor = .black
                
        viewControllers = [createController(viewController: SinglesCollectionViewController(), imageName: "Series"),
                           createController(viewController: UIViewController(), imageName: "Headphones"),
                           createController(viewController: UIViewController(), imageName: "profile")]
    }
    
    fileprivate func createController(viewController: UIViewController, imageName: String) -> UIViewController {
        
        viewController.view.backgroundColor = .white
        viewController.tabBarItem.title = imageName
        viewController.tabBarItem.image = UIImage(named: imageName)
        
        return viewController
    }
}
