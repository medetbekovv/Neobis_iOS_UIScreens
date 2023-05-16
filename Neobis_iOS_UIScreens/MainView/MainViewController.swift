//
//  MainViewController.swift
//  Neobis_iOS_UIScreens
//
//  Created by user on 16/5/23.
//

import UIKit

class MainViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    fileprivate let cellId = "cellId"
    fileprivate let views = ["umbrella", "bitok2", "finance2", "icons-location", "paper-plane"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(MainViewCell.self, forCellWithReuseIdentifier: cellId)
                
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? MainViewCell else {return UICollectionViewCell()}
        cell.imageView.image = UIImage(named: views[indexPath.item])
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return views.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 64, height: (view.frame.height / 5) - 30)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch indexPath.item {
        case 0: present(presentFullScreen(viewController: WeatherViewController()), animated: true)
        case 1: present(presentFullScreen(viewController: CryptoTabBarController()), animated: true)
        case 2: present(presentFullScreen(viewController: FinanceTabBarController()), animated: true)
        case 3: present(presentFullScreen(viewController: TravelCollectionViewController()), animated: true)
        default : present(presentFullScreen(viewController: SinglesTabBarController()), animated: true)
        }
    }
    
    fileprivate func presentFullScreen(viewController: UIViewController) -> UIViewController {
        viewController.modalPresentationStyle = .fullScreen
        return viewController
    }
    
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
