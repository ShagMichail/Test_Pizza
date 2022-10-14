//
//  File.swift
//  Test_Pizza
//
//  Created by Михаил Шаговитов on 13.10.2022.
//

import UIKit

class BannerCell: UICollectionViewCell {
    
    
    //MARK: - Properties
    
    private let bannerImage = UIImageView()
    
    
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
        bannerImage.sizeToFit()
        bannerImage.translatesAutoresizingMaskIntoConstraints = false
        bannerImage.clipsToBounds = true
        bannerImage.layer.cornerRadius = 10
        bannerImage.isUserInteractionEnabled = true
    }
    
    func configure(with data: Banner){
        bannerImage.image = UIImage(named: data.image)
    }
    
    private func setupAddition() {
        contentView.addSubview(bannerImage)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            bannerImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            bannerImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            bannerImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            bannerImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
}


extension BannerCell {
    
    static var nib : UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier : String{
        return String(describing: self)
    }
}

