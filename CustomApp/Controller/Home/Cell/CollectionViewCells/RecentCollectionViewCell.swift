//
//  RecentCollectionViewCell.swift
//  CustomApp
//
//  Created by Şükrü Özkoca on 6.01.2023.
//

import UIKit

class RecentCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var kindLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var ratioLabel: UILabel!
    @IBOutlet weak var bgImageView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        bgView.layer.opacity = 0
        imageView.layer.opacity = 0
        
        bgImageView.layer.cornerRadius = 15
        bgImageView.backgroundColor = UIColor(red: 1/255, green: 97/255, blue: 101/255, alpha: 1)
        imageView.image = UIImage(systemName: "character")
        imageView.tintColor = .white
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            UIView.animate(withDuration: 1) {
                self.bgView.layer.opacity = 1
                self.imageView.layer.opacity = 1
            }
        }
        
     
    }
}
