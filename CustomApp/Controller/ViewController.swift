//
//  ViewController.swift
//  CustomApp
//
//  Created by Şükrü Özkoca on 5.01.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var selectButton: UIButton!
    @IBOutlet weak var tabView: UIView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var firstItemImage: UIImageView!
    @IBOutlet weak var secondItemImage: UIImageView!
    @IBOutlet weak var thirdItemImage: UIImageView!
    
    @IBOutlet weak var thirdTabView: UIView!
    @IBOutlet weak var secondTabView: UIView!
    @IBOutlet weak var firstTabView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        baseView()
        tabItemConfigure()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func baseView() {
        firstItemImage.tintColor = .gray
        secondItemImage.tintColor = .black 
        thirdItemImage.tintColor = .gray
        secondTabView.backgroundColor = UIColor(red: 233/255, green: 244/255, blue: 68/255, alpha: 1)
        firstTabView.backgroundColor = .clear
        thirdTabView.backgroundColor = .clear
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let invest = self.storyboard?.instantiateViewController(identifier:"InvestmentViewController") as? InvestmentViewController else  {return}
        
        self.contentView.addSubview(invest.view)
        self.addChild(invest)
        invest.didMove(toParent: self)
        invest.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            invest.view.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            invest.view.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            invest.view.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            invest.view.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
        ])
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func tabItemConfigure() {
        let configuration = UIImage.SymbolConfiguration(scale: .small)
        firstItemImage.image = UIImage(systemName: "square.grid.2x2", withConfiguration: configuration)
        secondItemImage.image = UIImage(systemName: "house.fill",withConfiguration: configuration)
        thirdItemImage.image = UIImage(systemName: "gearshape.fill",withConfiguration: configuration)

        firstTabView.layer.cornerRadius = 10
        secondTabView.layer.cornerRadius = 10
        thirdTabView.layer.cornerRadius = 10
    }
    
    @IBAction func onClickTabBar(_ sender: UIButton) {
        let tag = sender.tag
        if tag == 0 {
            firstTabView.backgroundColor = UIColor(red: 233/255, green: 244/255, blue: 68/255, alpha: 1)
            secondTabView.backgroundColor = .clear
            thirdTabView.backgroundColor = .clear
            firstItemImage.tintColor = .black
            secondItemImage.tintColor = .gray
            thirdItemImage.tintColor = .gray
            guard let home = self.storyboard?.instantiateViewController(identifier:"HomeViewController") as? HomeViewController else  {return}
            contentView.addSubview(home.view)
            home.didMove(toParent: self)
        }
        else if tag == 1 {
            secondTabView.backgroundColor = UIColor(red: 233/255, green: 244/255, blue: 68/255, alpha: 1)
            firstTabView.backgroundColor = .clear
            thirdTabView.backgroundColor = .clear
            firstItemImage.tintColor = .gray
            secondItemImage.tintColor = .black
            thirdItemImage.tintColor = .gray
            guard let invest = self.storyboard?.instantiateViewController(identifier:"InvestmentViewController") as? InvestmentViewController else  {return}
            contentView.addSubview(invest.view)
            self.addChild(invest)
            invest.didMove(toParent: self)
        }
        else if tag == 2 {
            thirdTabView.backgroundColor = UIColor(red: 233/255, green: 244/255, blue: 68/255, alpha: 1)
            firstTabView.backgroundColor = .clear
            secondTabView.backgroundColor = .clear
            firstItemImage.tintColor = .gray
            secondItemImage.tintColor = .gray
            thirdItemImage.tintColor = .black
            guard let setting = self.storyboard?.instantiateViewController(identifier:"SettingViewController") as? SettingViewController else  {return}
            contentView.addSubview(setting.view)
            setting.didMove(toParent: self)
        }
    }
}

