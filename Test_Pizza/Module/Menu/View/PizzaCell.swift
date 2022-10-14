//
//  PizzaCell.swift
//  Test_Pizza
//
//  Created by Михаил Шаговитов on 13.10.2022.
//

import UIKit

class PizzaCell: UITableViewCell {
    
    
    //MARK: - Properties
    
    private let pizzaImage = UIImageView()
    private let nameLabel = UILabel()
    private let descriptionLabel = UILabel()
    
    lazy var buyButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .selectedColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    //MARK: - Functions
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupElements()
        setupAddition()
    }
    
    required init?(coder: NSCoder) {
        super .init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupLayout()
    }
    
    func setupElements() {
        
        nameLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        nameLabel.textColor = UIColor.black
        
        descriptionLabel.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        descriptionLabel.textColor = .description
        descriptionLabel.numberOfLines = 0
        
        pizzaImage.sizeToFit()
        
        buyButton.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        buyButton.titleLabel?.isUserInteractionEnabled = false
        buyButton.setTitleColor(.selectedColor, for: .normal)
        buyButton.layer.cornerRadius = 6
        buyButton.backgroundColor = UIColor.white
        buyButton.clipsToBounds = true
        buyButton.isUserInteractionEnabled = true
        buyButton.layer.borderWidth = 1
        buyButton.layer.borderColor = UIColor(named: "selectedColor")?.cgColor
        buyButton.isEnabled = false
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        pizzaImage.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configure(with data: Pizza){
        nameLabel.text = data.name
        descriptionLabel.text = data.description
        pizzaImage.image = UIImage(named: data.image)
        buyButton.setTitle("от \(data.cost) p", for: .normal)
    }
    
    private func setupAddition() {
        contentView.addSubview(pizzaImage)
        contentView.addSubview(nameLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(buyButton)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            
            pizzaImage.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            pizzaImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -29),
            pizzaImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            pizzaImage.heightAnchor.constraint(equalToConstant: 132),
            pizzaImage.widthAnchor.constraint(equalToConstant: 132),
            
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            nameLabel.leadingAnchor.constraint(equalTo: pizzaImage.trailingAnchor, constant: 32),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -27),
            
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: pizzaImage.trailingAnchor, constant: 32),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -27),
            
            buyButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            buyButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            buyButton.heightAnchor.constraint(equalToConstant: 32),
            buyButton.widthAnchor.constraint(equalToConstant: 87),
        ])
    }
}


extension PizzaCell {
    
    static var nib : UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier : String{
        return String(describing: self)
    }
}
