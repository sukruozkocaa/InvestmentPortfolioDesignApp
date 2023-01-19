//
//  HomeViewController.swift
//  CustomApp
//
//  Created by Şükrü Özkoca on 5.01.2023.
//

import UIKit

private enum TableCells:Int {
    case card
    case portfolio
    case portfolioContent
    case recent
    case recentContent
    static var count: Int { return TableCells.recentContent.rawValue + 1}
}

class HomeViewController: UIViewController {
    
    private let tableView: UITableView =    {
       let table = UITableView()
        table.isScrollEnabled = false
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .clear
        table.register(UINib(nibName:  "CollectionCell", bundle: nil), forCellReuseIdentifier: "CollectionCell")
        table.register(UINib(nibName: "CardTableViewCell", bundle: nil), forCellReuseIdentifier: "CardTableViewCell")
        table.register(UINib(nibName: "RecentTableViewCell", bundle: nil), forCellReuseIdentifier: "RecentTableViewCell")
        table.register(UINib(nibName: "PortfolioHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "PortfolioHeaderTableViewCell")
        return table
    }()
    
    private let headerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 228/255, green: 226/255, blue: 211/255, alpha: 0.9)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 60
        return view
    }()
        
    @IBOutlet weak var priceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .clear
        view.addSubview(headerView)
        headerViewConstraint()
        tableView.separatorInset = UIEdgeInsets.zero
        tableView.separatorColor = .clear
        view.backgroundColor = .white
        navBar()
        view.addSubview(tableView)
        collectionViewConstraint()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func collectionViewConstraint() {
        NSLayoutConstraint.activate([
            tableView.widthAnchor.constraint(equalToConstant: view.frame.width),
            tableView.heightAnchor.constraint(equalToConstant: 600),
            tableView.topAnchor.constraint(equalTo: priceLabel.bottomAnchor,constant: 5)
        ])
    }
    
    func headerViewConstraint() {
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.topAnchor,constant:250),
            headerView.widthAnchor.constraint(equalToConstant: view.frame.width),
            headerView.heightAnchor.constraint(equalToConstant: view.frame.height)
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
      //  cardOne.rotate360Degrees()
    }
 
    func navBar() {
        let navBar = UINavigationBar(frame: CGRect(x: 10, y: 50, width: view.frame.width-20, height: 40))
        navBar.barTintColor = .white
        view.addSubview(navBar)
        navBar.tintColor = .black
        //Border Kaldırma
        navBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navBar.shadowImage = UIImage()
        let navItem = UINavigationItem(title: "Investment account")
        navItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName:  "line.3.horizontal.decrease"), style: .plain, target: self, action: #selector(setMenu))
        navItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named:  "colon"), style: .plain, target: self, action: #selector(setMenu))
        navBar.setItems([navItem], animated: false)
    }
    
    @objc func setMenu() {
        print( "Clicked")
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TableCells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: TableCells = TableCells.init(rawValue: indexPath.row)!
        switch cell {
        case .card:
            let cell: CardTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CardTableViewCell", for: indexPath) as! CardTableViewCell
            return cell
           
        case .portfolio:
            let cell: PortfolioHeaderTableViewCell = tableView.dequeueReusableCell(withIdentifier: "PortfolioHeaderTableViewCell", for: indexPath) as! PortfolioHeaderTableViewCell
            cell.text = "My portfolio"
            return cell
        case .portfolioContent:
            let cell: CollectionCell = tableView.dequeueReusableCell(withIdentifier:  "CollectionCell", for: indexPath) as! CollectionCell
            return cell
        case .recent:
            let cell: PortfolioHeaderTableViewCell = tableView.dequeueReusableCell(withIdentifier: "PortfolioHeaderTableViewCell", for: indexPath) as! PortfolioHeaderTableViewCell
            cell.text = "Recent"
            return cell
        case .recentContent:
            let cell: RecentTableViewCell = tableView.dequeueReusableCell(withIdentifier: "RecentTableViewCell", for: indexPath) as! RecentTableViewCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cell: TableCells = TableCells.init(rawValue: indexPath.row)!
        switch cell {
        case .card:
            return 140
        case .portfolio:
            return 30
        case .portfolioContent:
            return 230
        case .recent:
            return 60
        case .recentContent:
            return 140
        }
    }
}

