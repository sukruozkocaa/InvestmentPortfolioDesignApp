//
//  LastSpendingTitleCell.swift
//  CustomApp
//
//  Created by Şükrü Özkoca on 6.01.2023.
//

import UIKit

class LastSpendingTitleCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.register(UINib(nibName: "LastSpendingCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "LastSpendingCollectionViewCell")
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

extension LastSpendingTitleCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: LastSpendingCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "LastSpendingCollectionViewCell", for: indexPath) as! LastSpendingCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 300)
    }
    
}
