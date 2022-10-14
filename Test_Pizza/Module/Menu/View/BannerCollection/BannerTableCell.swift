//
//  BannerTableCell.swift
//  Test_Pizza
//
//  Created by Михаил Шаговитов on 13.10.2022.
//

import UIKit

class BannerTableCell: UIView {
    
    
    //MARK: - Properties
    
    private lazy var banerCollection: UICollectionView = {
        let layout = MenuCollectionLayout()
        layout.scrollDirection = .horizontal
        
        let collection = UICollectionView(frame: .init(), collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.isPagingEnabled = false
        
        collection.showsHorizontalScrollIndicator = false
        collection.showsVerticalScrollIndicator = false
        return collection
    }()
    
    
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
        banerCollection.translatesAutoresizingMaskIntoConstraints = false
        banerCollection.backgroundColor = .backgroundNavBar
        banerCollection.register(BannerCell.self, forCellWithReuseIdentifier: BannerCell.identifier)
        banerCollection.dataSource = self
        banerCollection.delegate = self
        
    }
    
    private func setupAddition() {
        addSubview(banerCollection)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            
            banerCollection.topAnchor.constraint(equalTo: topAnchor, constant: -10),
            banerCollection.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -0.1),
            banerCollection.leadingAnchor.constraint(equalTo: leadingAnchor),
            banerCollection.trailingAnchor.constraint(equalTo: trailingAnchor),
            banerCollection.heightAnchor.constraint(equalToConstant: 140),
        ])
    }
}


extension BannerTableCell {
    
    static var nib : UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier : String{
        return String(describing: self)
    }
}


extension BannerTableCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCell.identifier, for: indexPath) as? BannerCell else { return UICollectionViewCell() }
        let data = banners[indexPath.row]
        cell.configure(with: data)
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return banners.count
    }
    
}

extension BannerTableCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return -15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 20, left: 0, bottom: 20, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width - 50
        return .init(width: width, height: collectionView.bounds.height)
    }
}
