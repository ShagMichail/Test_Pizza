//
//  File.swift
//  Test_Pizza
//
//  Created by Михаил Шаговитов on 13.10.2022.
//


import UIKit

class SectionButtonCell: UICollectionViewCell {
    
    
    //MARK: - Properties
    
    let nameCategoryLabel = UILabel()
    var isClicked = Bool()
    
    //MARK: - Functions
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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
        isClicked = false
        
        alpha = 0.4
        layer.cornerRadius = 10
        layer.borderWidth = 1
        layer.borderColor = UIColor(named: "unselectedMenu")?.cgColor
        
        nameCategoryLabel.translatesAutoresizingMaskIntoConstraints = false
        nameCategoryLabel.textColor = UIColor(named: "unselectedMenu")
        nameCategoryLabel.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        nameCategoryLabel.textAlignment = .center
    }
    
    func configure(with data: String){
        nameCategoryLabel.text = data
    }
    
    private func setupAddition() {
        contentView.addSubview(nameCategoryLabel)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            nameCategoryLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            nameCategoryLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            nameCategoryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            nameCategoryLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
}


extension SectionButtonCell {
    
    static var nib : UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier : String{
        return String(describing: self)
    }
}
