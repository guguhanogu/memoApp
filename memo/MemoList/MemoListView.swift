//
//  MemoListView.swift
//  memo
//
//  Created by 최한호 on 2021/09/17.
//

import Foundation
import UIKit
import SnapKit


class MemoListView: UIView {
    
    let firstButton: UIButton = {
        let firstButton = UIButton()
        firstButton.setTitle("메모 내용 뷰로 가기", for: .normal)
        firstButton.isUserInteractionEnabled = true
        firstButton.backgroundColor = .cyan
        firstButton.titleLabel?.textColor = .white
        
        return firstButton
    }()
    
    let secondButton: UIButton = {
        let secondButton = UIButton()
        secondButton.setTitle("메모 에디터로 가기", for: .normal)
        secondButton.isUserInteractionEnabled = true
        secondButton.backgroundColor = .green
        secondButton.titleLabel?.textColor = .white
        
        return secondButton
    }()
    
    
    func makeSubview() {
        addSubview(firstButton)
        addSubview(secondButton)
    }
    
    func makeConstraint() {
        firstButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            firstButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            firstButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            firstButton.widthAnchor.constraint(equalTo: widthAnchor, constant: 0),
            firstButton.heightAnchor.constraint(equalToConstant: 100),
        ])
        secondButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            secondButton.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: 20),
            secondButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            secondButton.widthAnchor.constraint(equalTo: widthAnchor, constant: 0),
            secondButton.heightAnchor.constraint(equalToConstant: 100),
        ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeSubview()
        makeConstraint()
        backgroundColor = .white
    }
    
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemnted")
    }
}
