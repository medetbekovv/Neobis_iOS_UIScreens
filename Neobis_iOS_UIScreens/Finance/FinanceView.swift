//
//  FinanceView.swift
//  Neobis_iOS_UIScreens
//
//  Created by user on 16/5/23.
//

import UIKit
import SnapKit

class FinanceView: UIView {
    
    private lazy var balanceLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.062, green: 0.062, blue: 0.062, alpha: 1)
        label.font = UIFont(name: "Inter-SemiBold", size: 16)
        label.textAlignment = .center
        label.text = "Баланс"
        return label
    }()
    
    private lazy var moneyLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont(name: "Inter-Medium", size: 36)
        label.textAlignment = .center
        label.text = "$1200.89"
        return label
    }()
    
    private lazy var monthLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont(name: "Inter-Light", size: 18)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 0.92
        label.textAlignment = .center
        label.attributedText = NSMutableAttributedString(string: "Апрель 2020", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return label
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.setImage(UIImage(named: "right"), for: .normal)
        return button
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.setImage(UIImage(named: "right"), for: .normal)
        button.transform = CGAffineTransform(scaleX: -1, y: 1)
        return button
    }()
    
    let collectionViewController = FinanceCollectionViewController()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupViews()
    }

    fileprivate func setupViews() {
        
        addSubview(balanceLabel)
        balanceLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(flexibleHeight(to: 66))
        }
        addSubview(moneyLabel)
        moneyLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(balanceLabel.snp.bottom).offset(7)
        }
        addSubview(monthLabel)
        monthLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(moneyLabel.snp.bottom).offset(flexibleHeight(to: 30))
        }
        addSubview(nextButton)
        nextButton.snp.makeConstraints { make in
            make.top.equalTo(monthLabel.snp.top)
            make.trailing.equalToSuperview().offset(-(flexibleWidth(to: 45)))
        }

        addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.top.equalTo(monthLabel.snp.top)
            make.leading.equalToSuperview().offset(flexibleWidth(to: 45))

        }
        
        addSubview(collectionViewController.collectionView)
        collectionViewController.collectionView.snp.makeConstraints { make in
            make.top.equalTo(monthLabel.snp.bottom).offset(flexibleHeight(to: 50))
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview().offset(-(flexibleHeight(to: 100)))
            
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class FinanceCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    let footerId = "footerId"
    
    let items = [Finance(imageName: "home_alt_fill", category: "Дом", money: "$321", spentOn: "Продукты", color: UIColor(red: 1, green: 0.766, blue: 0.158, alpha: 1)),
                 Finance(imageName: "tag", category: "Покупки", money: "$574", spentOn: "Одежда", color: UIColor(red: 0.236, green: 0, blue: 0.621, alpha: 1)),
                 Finance(imageName: "happy", category: "Транспорт", money: "$124", spentOn: "Такси", color: UIColor(red: 0.612, green: 0.78, blue: 0.255, alpha: 1)),
                 Finance(imageName: "heart_fill", category: "Здоровье", money: "$765", spentOn: "Лечение", color: UIColor(red: 0.756, green: 0.253, blue: 0.8, alpha: 1)),
                 Finance(imageName: "cookie", category: "Фитнес", money: "$324", spentOn: "Тренировки", color: UIColor(red: 0.121, green: 0.525, blue: 1, alpha: 1)),
                 Finance(imageName: "mail", category: "Счета", money: "$726", spentOn: "Комунальные", color: UIColor(red: 0.13, green: 0.755, blue: 0.892, alpha: 1)),
                 Finance(imageName: "heart_fill", category: "Ресторан", money: "$325", spentOn: "Ужин", color: UIColor(red: 0.756, green: 0.253, blue: 0.8, alpha: 1))]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        collectionView.layer.cornerRadius = 31
        
        collectionView.register(FinanceCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(FinanceFooter.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footerId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: footerId, for: indexPath) as? FinanceFooter else {return UICollectionReusableView()}
        return footer
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: flexibleHeight(to: 100))
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? FinanceCell else {return UICollectionViewCell()}
        cell.nameLabel.text = items[indexPath.item].category
        cell.moneyLabel.text = items[indexPath.item].money
        cell.spentOnLabel.text = items[indexPath.item].spentOn
        cell.imageView.backgroundColor = items[indexPath.item].color
        cell.imageView.image = UIImage(named: items[indexPath.item].imageName)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.frame.width, height: collectionView.frame.height / 10)
    }
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class FinanceTabBarController: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.tintColor = .black
        
        viewControllers = [createController(viewController: FinanceViewController(), title: "Главная", imageName: "main"),
                           createController(viewController: UIViewController(), title: "Отчеты", imageName: "report"),
                           createController(viewController: UIViewController(), title: "Профиль", imageName: "profile")]
    }
    
    fileprivate func createController(viewController: UIViewController, title: String, imageName: String) -> UIViewController {
        
        viewController.view.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = UIImage(named: imageName)
        
        return viewController
    }
}
