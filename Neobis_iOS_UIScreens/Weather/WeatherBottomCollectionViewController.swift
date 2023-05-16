//
//  WeatherBottomCollectionViewController.swift
//  Neobis_iOS_UIScreens
//
//  Created by user on 16/5/23.
//

import UIKit


class WeatherBottomCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    
    var items = [Weather(temp: "21°C", image: "Дождь", date: "Апр,27"),
                 Weather(temp: "22°C", image: "Дождь", date: "Апр,28"),
                 Weather(temp: "34°C", image: "Sunny", date: "Апр,29"),
                 Weather(temp: "34°C", image: "Sunny", date: "Апр,30"),
                 Weather(temp: "34°C", image: "Sunny", date: "Май,1"),
                 Weather(temp: "27°C", image: "cloud", date: "Май,2"),
                 Weather(temp: "32°C", image: "Солнечно облачно", date: "Май,3")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .clear
        collectionView.register(WeatherBottomCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.showsVerticalScrollIndicator = true
        collectionView.indicatorStyle = .white
        collectionView.alwaysBounceVertical = true

    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? WeatherBottomCell else {return UICollectionViewCell()}
        cell.dateLabel.text = items[indexPath.item].date
        cell.tempLabel.text = items[indexPath.item].temp
        cell.imageView.image = UIImage(named: items[indexPath.item].image)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.frame.width, height: collectionView.frame.height / 6)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
