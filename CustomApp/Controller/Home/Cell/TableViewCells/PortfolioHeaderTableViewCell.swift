//
//  PortfolioHeaderTableViewCell.swift
//  CustomApp
//
//  Created by Şükrü Özkoca on 6.01.2023.
//

import UIKit

class PortfolioHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    var text: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.register(UINib(nibName: "PortfolioHeaderCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PortfolioHeaderCollectionViewCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension PortfolioHeaderTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: PortfolioHeaderCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PortfolioHeaderCollectionViewCell", for: indexPath) as! PortfolioHeaderCollectionViewCell
        cell.configure(text: text ?? "aaa")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 30)
    }
    
}
