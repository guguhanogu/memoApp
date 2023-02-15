//
//  MemoListCollectionViewCell.swift
//  memo
//
//  Created by 최한호 on 2021/10/14.
//

import Foundation
import UIKit

class MemoListCollectionViewCell: UICollectionViewCell {
    
    var titleLabel: UILabel!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpCell()
        setUpLabel()
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setUpCell()
        setUpLabel()
    }
    
    func setUpCell() {
        titleLabel = UILabel()
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    func setUpLabel() {
        titleLabel.font = UIFont.systemFont(ofSize: 32)
        titleLabel.textAlignment = .center
        
    }
    
}
