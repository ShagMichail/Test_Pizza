//
//  MenuVCViewController.swift
//  Test_Pizza
//
//  Created by Михаил Шаговитов on 13.10.2022.
//

import UIKit

class MenuVC: UIViewController {
    
    
    //MARK: - Properties
    
    private var productTable = UITableView()
    private let navBar = NavBarView()
    
    
    //MARK: - Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupElement()
        setupAddition()
        setupLayout()
        setupNavBar()
    }
    
    private func setupNavBar() {
        navigationController?.navigationBar.isHidden = true
    }
    
    private func setupView() {
        view.backgroundColor = .backgroundNavBar
    }
    
    private func setupElement() {
        productTable.showsVerticalScrollIndicator = false
        productTable.translatesAutoresizingMaskIntoConstraints = false
        productTable.register(PizzaCell.self, forCellReuseIdentifier: PizzaCell.identifier)
        productTable.dataSource = self
        productTable.delegate = self
        productTable.backgroundColor = .backgroundNavBar
        productTable.tableHeaderView = BannerTableCell()
        productTable.tableHeaderView?.frame = CGRect(x: 0, y: 0, width: 0, height: 120)
        productTable.sectionHeaderTopPadding = 0.0
        navBar.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupAddition() {
        view.addSubview(navBar)
        view.addSubview(productTable)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            navBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            navBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            navBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            navBar.heightAnchor.constraint(equalToConstant: 80),
            
            productTable.topAnchor.constraint(equalTo: navBar.bottomAnchor, constant: 20),
            productTable.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            productTable.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            productTable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
}

extension MenuVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension MenuVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 60
        } else {
            return 0.01
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let header = SectionTableCell()
            header.backgroundColor = UIColor.clear
            return header
        } else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pizzas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PizzaCell.identifier, for: indexPath) as? PizzaCell else { return UITableViewCell()}
        cell.configure(with: pizzas[indexPath.row])
        cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 172
    }
    
}


