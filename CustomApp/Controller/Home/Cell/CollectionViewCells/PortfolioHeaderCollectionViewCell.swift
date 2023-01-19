//
//  PortfolioHeaderCollectionViewCell.swift
//  CustomApp
//
//  Created by Şükrü Özkoca on 6.01.2023.
//

import UIKit

class PortfolioHeaderCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        nextButton.setImage(UIImage(systemName: "greaterthan"), for: .normal)
        nextButton.tintColor = .black
    }
    
    func configure(text: String) {
        headerLabel.text = text
    }

}
