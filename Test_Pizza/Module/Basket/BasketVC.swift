//
//  BasketVC.swift
//  Test_Pizza
//
//  Created by Михаил Шаговитов on 13.10.2022.
//

import UIKit

class BasketVC: UIViewController {
    
    
    //MARK: - Properties
    
    private let titleLabel = UILabel()
    
    
    //MARK: - Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupElement()
        setupAddition()
        setupLayout()
    }
    
    private func setupElement() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Корзина"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        
    }
    
    private func setupAddition() {
        view.addSubview(titleLabel)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: UIScreen.main.bounds.height / 2),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: UIScreen.main.bounds.width / 3),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -UIScreen.main.bounds.width / 3),
        ])
    }

}
