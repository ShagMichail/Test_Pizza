//
//  SectionTableCell.swift
//  Test_Pizza
//
//  Created by Михаил Шаговитов on 13.10.2022.
//

import UIKit

class SectionTableCell: UIView {
    
    
    //MARK: - Properties
    
    private lazy var sectionCollection: UICollectionView = {
        let layout = MenuCollectionLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .init(), collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.isPagingEnabled = false
        
        collection.showsHorizontalScrollIndicator = false
        collection.showsVerticalScrollIndicator = false
        return collection
    }()
    
    var indexPathForSelectedButton: IndexPath?
    var firstFlag = true
    let data = ["Пицца","Напитки","Комбо","Акции","Соусы"]
    
    
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
        sectionCollection.backgroundColor = .backgroundNavBar
        sectionCollection.register(SectionButtonCell.self, forCellWithReuseIdentifier: SectionButtonCell.identifier)
        sectionCollection.dataSource = self
        sectionCollection.delegate = self
    }
    
    private func setupAddition() {
        addSubview(sectionCollection)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            
            sectionCollection.topAnchor.constraint(equalTo: topAnchor),
            sectionCollection.leadingAnchor.constraint(equalTo: leadingAnchor),
            sectionCollection.trailingAnchor.constraint(equalTo: trailingAnchor),
            sectionCollection.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}


extension SectionTableCell {
    
    static var nib : UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier : String{
        return String(describing: self)
    }
}


extension SectionTableCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SectionButtonCell.identifier, for: indexPath) as? SectionButtonCell else { return UICollectionViewCell() }
        let data = data[indexPath.row]
        
        cell.configure(with: data)
        if (indexPath == indexPathForSelectedButton) || (firstFlag && indexPath.row == 0) {
            firstFlag = false
            cell.isClicked = true
            cell.backgroundColor = UIColor(named: "unselectedMenu")
        } else {
            cell.isClicked = false
            cell.backgroundColor = .clear
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        indexPathForSelectedButton = indexPath
        sectionCollection.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
}

extension SectionTableCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return .init(width: 80, height: 32)
    }
}
