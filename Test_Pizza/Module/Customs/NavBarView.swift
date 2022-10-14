//
//  NavBarView.swift
//  Test_Pizza
//
//  Created by Михаил Шаговитов on 13.10.2022.
//

import UIKit

class NavBarView: UIView {
    
    
    //MARK: - Properties
    private var cityLabel = UILabel()
    var navButton = UIButton()
    
    
    //MARK: - Functions
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupElement()
        setupView()
        setupAddition()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.backgroundColor = .backgroundNavBar
    }
    
    private func setupElement() {
        navButton.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(named:"listButton")
        navButton.setImage(image, for: .normal)
        navButton.isUserInteractionEnabled = true
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        cityLabel.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        cityLabel.textColor = UIColor.black
        cityLabel.text = "Москва"
    }
    
    private func setupAddition() {
        addSubview(cityLabel)
        addSubview(navButton)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            cityLabel.topAnchor.constraint(equalTo: topAnchor, constant: 55),
            cityLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            navButton.topAnchor.constraint(equalTo: topAnchor, constant: 55),
            navButton.leadingAnchor.constraint(equalTo: cityLabel.trailingAnchor, constant: 6),
            
        ])
    }
}
