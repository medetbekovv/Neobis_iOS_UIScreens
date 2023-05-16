//
//  CryptoMainView.swift
//  Neobis_iOS_UIScreens
//
//  Created by user on 16/5/23.
//

import UIKit
class CryptoMainView: UIView {
    
    private lazy var portfolioLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.09, green: 0.09, blue: 0.1, alpha: 1)
        label.font = UIFont(name: "SegoeUI-Bold", size: 32)
        label.attributedText = NSMutableAttributedString(string: "Портфолио", attributes: [NSAttributedString.Key.kern: 0.41])
        return label
    }()
    
    private lazy var settingsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "Settings"), for: .normal)
        button.tintColor = UIColor(red: 0.725, green: 0.757, blue: 0.851, alpha: 1)
        return button
    }()
    
    private lazy var allButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("посмотреть все", for: .normal)
        button.tintColor =  UIColor(red: 0.965, green: 0.329, blue: 0.243, alpha: 1)
        button.titleLabel?.font = UIFont(name: "SegoeUI-Light", size: 14)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 0.86
        var buttonAtributtedText = NSMutableAttributedString(string: "посмотреть все", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        button.setAttributedTitle(buttonAtributtedText, for: .normal)
        return button
    }()
    
    let collectionViewController = CryptoCollectionViewController()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupViews()
    }
    
    fileprivate func setupViews() {
        
        addSubview(portfolioLabel)
        portfolioLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(flexibleHeight(to: 80))
            make.leading.equalToSuperview().offset(flexibleWidth(to: 28))
        }
        addSubview(settingsButton)
        settingsButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(flexibleHeight(to: 86))
            make.trailing.equalToSuperview().offset(-(flexibleWidth(to: 28)))
        }
        addSubview(allButton)
        allButton.snp.makeConstraints { make in
            make.top.equalTo(settingsButton.snp.bottom).offset(flexibleHeight(to: 40))
            make.trailing.equalToSuperview().offset(-(flexibleWidth(to: 28)))
        }
        
        addSubview(collectionViewController.collectionView)
        collectionViewController.collectionView.snp.makeConstraints { make in
            make.top.equalTo(allButton.snp.bottom).offset(flexibleHeight(to: 10))
            make.trailing.equalToSuperview().offset(-(flexibleWidth(to: 28)))
            make.leading.equalToSuperview().offset(flexibleWidth(to: 28))
            make.bottom.equalToSuperview().offset(-(flexibleHeight(to: 100)))
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class CryptoCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
    fileprivate let cellId = "cellId"
    let items = [Crypto(name: "Bitcoin", change: "+1.6%", priceUsd: "29,850.15", priceBtc: "2.73 BTC", color: UIColor(red: 254/255, green: 238/255, blue: 236/255, alpha: 1)),
                 Crypto(name: "Ethereum", change: "-0.82%", priceUsd: "10,561.24", priceBtc: "47.61 ETH", color: UIColor(red: 239/255, green: 241/255, blue: 249/255, alpha: 1)),
                 Crypto(name: "Litecoin", change: "-2.10", priceUsd: "3,676.24", priceBtc: "39.27 LTC", color: UIColor(red: 234/255, green: 252/255, blue: 246/255, alpha: 1)),
                 Crypto(name: "Ripple", change: "+0.27%", priceUsd: "5,241.62", priceBtc: "16447,65 XPR", color: UIColor(red: 239/255, green: 244/255, blue: 255/255, alpha: 1)),
                 Crypto(name: "Ripple", change: "+0.27%", priceUsd: "5,241.62", priceBtc: "16447,65 XPR", color: UIColor(red: 239/255, green: 244/255, blue: 255/255, alpha: 1)),
                 Crypto(name: "Ripple", change: "+0.27%", priceUsd: "5,241.62", priceBtc: "16447,65 XPR", color: UIColor(red: 239/255, green: 244/255, blue: 255/255, alpha: 1))]
    
    
    override func viewDidLoad() {
        super .viewDidLoad()
        
        collectionView.register(CryptoCell.self, forCellWithReuseIdentifier: cellId)
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? CryptoCell else {return UICollectionViewCell()}
        
        let nameLabelparagraphStyle = NSMutableParagraphStyle()
        nameLabelparagraphStyle.lineHeightMultiple = 1
        
        let changeLabelparagraphStyle = NSMutableParagraphStyle()
        changeLabelparagraphStyle.lineHeightMultiple = 1

        let priceUsdparagraphStyle = NSMutableParagraphStyle()
        priceUsdparagraphStyle.lineHeightMultiple = 1
        
        let priceBtcparagraphStyle = NSMutableParagraphStyle()
        priceBtcparagraphStyle.lineHeightMultiple = 1
        
        cell.nameLabel.attributedText = NSMutableAttributedString(string: items[indexPath.item].name, attributes: [NSAttributedString.Key.paragraphStyle: nameLabelparagraphStyle])
        cell.changeLabel.attributedText = NSMutableAttributedString(string: items[indexPath.item].change, attributes: [NSAttributedString.Key.paragraphStyle: changeLabelparagraphStyle])
        cell.priceUsdLabel.attributedText = NSMutableAttributedString(string: items[indexPath.item].priceUsd , attributes: [NSAttributedString.Key.kern: -0.32, NSAttributedString.Key.paragraphStyle: priceUsdparagraphStyle])
        cell.priceBtcLabel.attributedText = NSMutableAttributedString(string: items[indexPath.item].priceBtc, attributes: [NSAttributedString.Key.paragraphStyle: priceBtcparagraphStyle])
        cell.imageView.image = UIImage(named: items[indexPath.item].name)
        cell.imageView.backgroundColor = items[indexPath.item].color
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.frame.width, height: collectionView.frame.height / 7)
    }
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
