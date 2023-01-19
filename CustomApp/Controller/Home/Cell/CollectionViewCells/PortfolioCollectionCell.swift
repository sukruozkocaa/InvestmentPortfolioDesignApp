//
//  PortfolioCollectionCell.swift
//  CustomApp
//
//  Created by Şükrü Özkoca on 6.01.2023.
//

import UIKit

class PortfolioCollectionCell: UICollectionViewCell {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var bgImageView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bgView.layer.opacity = 0
        bgImageView.layer.opacity = 0
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            UIView.animate(withDuration: 1) {
                self.bgView.isHidden = false
                self.bgView.layer.opacity = 1
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.4) {
            UIView.animate(withDuration: 1) {
                self.bgImageView.tintColor = .black
                self.bgImageView.backgroundColor = UIColor(red: 228/255, green: 226/255, blue: 211/255, alpha: 0.9)
                self.bgImageView.layer.opacity = 1
            }
        }
        
        self.bgView.layer.cornerRadius = 10
        self.bgImageView.layer.cornerRadius = 10
        self.imageView.image = UIImage(systemName: "handbag.fill")
    }
}
