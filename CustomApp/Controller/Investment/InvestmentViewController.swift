//
//  InvestmentViewController.swift
//  CustomApp
//
//  Created by Şükrü Özkoca on 5.01.2023.
//

import UIKit
import AAInfographics

private enum TableCells:Int {
    case lastSp
    case portfolio
    case recent
    static var count: Int { return TableCells.recent.rawValue + 1}
}

class InvestmentViewController: UIViewController {
    
    private let segmentedControl: UISegmentedControl = {
        let segment = UISegmentedControl(items: ["Spending","Not worth"])
        segment.selectedSegmentIndex = 0
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        segment.setTitleTextAttributes(titleTextAttributes, for:.normal)

        let titleTextAttributes1 = [NSAttributedString.Key.foregroundColor: UIColor.white]
        segment.setTitleTextAttributes(titleTextAttributes1, for:.selected)
        
        segment.selectedSegmentTintColor = UIColor(red: 1/255, green: 97/255, blue: 101/255, alpha: 1)
        segment.backgroundColor = UIColor(red: 228/255, green: 226/255, blue: 211/255, alpha: 1)
        segment.translatesAutoresizingMaskIntoConstraints = false
        return segment
    }()
    
    private let priceLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "$1,843.90"
        label.textColor = .black
        label.font = UIFont(name: "GillSans-Bold", size: 33)
        return label
    }()
    
    private let yourBalanceLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.text = "Your balance"
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    private let tableView: UITableView = {
       let tableView = UITableView()
        tableView.isScrollEnabled = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.register(UINib(nibName: "PortfolioHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "PortfolioHeaderTableViewCell")
        tableView.register(UINib(nibName: "RecentTableViewCell", bundle: nil), forCellReuseIdentifier: "RecentTableViewCell")
        tableView.register(UINib(nibName: "LastSpendingTitleCell", bundle: nil), forCellReuseIdentifier: "LastSpendingTitleCell")
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navBar()
        segmentedControl.tintColor = .white
        tableView.separatorInset = UIEdgeInsets.zero
        tableView.separatorColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        segmentedControlConstraint()
 
           
    }
        
    func navBar() {
        let navBar = UINavigationBar(frame: CGRect(x: 10, y: 50, width: view.frame.width-20, height: 40))
        navBar.barTintColor = .white
        view.addSubview(navBar)
        navBar.tintColor = .black
        navBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navBar.shadowImage = UIImage()
        let navItem = UINavigationItem(title: "My portfolio")
        navItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName:  "line.3.horizontal.decrease"), style: .plain, target: self, action: #selector(setMenu))
        navItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named:  "colon"), style: .plain, target: self, action: #selector(setMenu))
        navBar.setItems([navItem], animated: false)
    }
    
    @objc func setMenu() {
    }
    
    func segmentedControlConstraint() {
        view.addSubview(segmentedControl)

        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo:view.topAnchor,constant: 110),
            segmentedControl.widthAnchor.constraint(equalToConstant: 280),
            segmentedControl.heightAnchor.constraint(equalToConstant: 40),
            segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        view.addSubview(priceLabel)
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor,constant: 30),
            priceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30)
        ])
        view.addSubview(yourBalanceLabel)
        NSLayoutConstraint.activate([
            yourBalanceLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 5),
            yourBalanceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30)
        ])
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: yourBalanceLabel.bottomAnchor,constant: 40),
            tableView.widthAnchor.constraint(equalToConstant: view.frame.size.width),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension InvestmentViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TableCells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: TableCells = TableCells.init(rawValue: indexPath.row)!
        switch cell {
        case .lastSp:
            let cell: LastSpendingTitleCell = tableView.dequeueReusableCell(withIdentifier: "LastSpendingTitleCell", for: indexPath) as! LastSpendingTitleCell
            cell.backgroundColor = .black
            return cell
        case .portfolio:
            let cell: PortfolioHeaderTableViewCell = tableView.dequeueReusableCell(withIdentifier: "PortfolioHeaderTableViewCell", for: indexPath) as! PortfolioHeaderTableViewCell
            cell.text = "Last spendings"
            return cell
        case .recent:
            let cell: RecentTableViewCell = tableView.dequeueReusableCell(withIdentifier: "RecentTableViewCell", for: indexPath) as! RecentTableViewCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cell: TableCells = TableCells.init(rawValue: indexPath.row)!
        switch cell {
        case .lastSp:
            return 300
        case .portfolio:
            return 80
        case .recent:
            return 130
        }
    }
}
