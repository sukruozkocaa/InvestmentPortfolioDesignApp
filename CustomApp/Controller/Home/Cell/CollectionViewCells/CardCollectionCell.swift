//
//  CardCollectionCell.swift
//  CustomApp
//
//  Created by Şükrü Özkoca on 6.01.2023.
//

import UIKit

class CardCollectionCell: UICollectionViewCell {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 70, height: 0))
        imageView.image = UIImage(systemName: "creditcard")
        imageView.tintColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = true
        return imageView
    }()
    
    private let label: UILabel = {
       let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 10))
        label.numberOfLines = 0
        label.layer.opacity = 0
        label.text = "One time"
        label.textColor = .white
        label.font = UIFont(name: "GillSans-Bold", size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let abcView = UIView(frame: CGRect(x: 0, y: 100, width: 100, height: 0))
    override func awakeFromNib() {
        super.awakeFromNib()
        abcView.layer.cornerRadius = 5
        abcView.backgroundColor = UIColor(red: 1/255, green: 97/255, blue: 101/255, alpha: 1)
        abcView.center = self.center
        addSubview(abcView)
        abcView.addSubview(imageView)
        abcView.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: abcView.centerXAnchor)
        ])
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            UIView.animate(withDuration: 1, animations: {
                self.abcView.frame = CGRect(x: 0, y: 0, width: 100, height: 75)
                NSLayoutConstraint.activate([
                    self.imageView.centerXAnchor.constraint(equalTo: self.abcView.centerXAnchor)
                ])
                self.imageView.frame = CGRect(x: self.abcView.frame.size.width/2-20, y: 10, width: 40, height: 30)
                NSLayoutConstraint.activate([
                    self.label.topAnchor.constraint(equalTo: self.abcView.topAnchor,constant: 50)
                ])
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.label.layer.opacity = 1
                }
            })
        }
        
    }
}
