//
//  WelcomeViewController.swift
//  CustomApp
//
//  Created by Şükrü Özkoca on 6.01.2023.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(Constants.shared.screenSize.width)
        startButton.layer.cornerRadius = 10
        view.backgroundColor = UIColor(red: 228/255, green: 226/255, blue: 211/255, alpha: 1)
    }
    
    @IBAction func clickStart(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ViewController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
