//
//  CollectionViewCell.swift
//  CaringCollection
//
//  Created by Denis Evdokimov on 11/27/23.
//

import UIKit

class CollectionCell: UICollectionViewCell {
    
    static let identifier = "CollectionCell"
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    func setup() {
        self.layer.cornerRadius = 5.0
        self.backgroundColor    = .systemGray
    }
    
}
