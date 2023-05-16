//
//  SinglesCollectionViewController.swift
//  Neobis_iOS_UIScreens
//
//  Created by user on 16/5/23.
//

import UIKit

class SinglesCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var items = [Serials(name: "SOS", description: "Mini meltdown? Get some\nHeadspace in a hurry", image: "Book"),
                 Serials(name: "One-the-Go", description: "Mindful living? Get your Headspace to go", image: "Bookshelf"),
                 Serials(name: "Classic", description: "Like it simple? Get some extra Headspace", image: "Diploma"),
                 Serials(name: "SOS", description: "Mini meltdown? Get some\nHeadspace in a hurry", image: "Globus")]
    
    let cellId = "cellId"
    let headerId = "headerID"

    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        collectionView.register(SinglesCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(SinglesCollectionViewHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
    
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 200 {
            self.dismiss(animated: true)
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as? SinglesCollectionViewHeader else {return UICollectionReusableView()}
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: flexibleHeight(to: 113))
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? SinglesCollectionViewCell else {return UICollectionViewCell()}
        cell.serials = items[indexPath.item]
        if indexPath.item % 2 != 0 {
            cell.imageAndLabelStackView.transform = CGAffineTransform(scaleX: -1, y: 1)
            cell.imageView.transform = CGAffineTransform(scaleX: -1, y: 1)
            cell.labelStackView.transform = CGAffineTransform(scaleX: -1, y: 1)
        }
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: flexibleHeight(to: 201))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
