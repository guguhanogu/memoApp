//
//  MemoViewController.swift
//  memo
//
//  Created by 최한호 on 2021/09/17.
//

import Foundation
import UIKit
import SnapKit


class MemoListViewController: UIViewController{
    
    // NavigationButton_Left
    lazy var leftButton: UIBarButtonItem = {
        let button = UIBarButtonItem(title: "정렬", style: .plain, target: self, action: #selector(buttonPressed(_:)))
        
        return button
    }()
    
    // NavigationButton_Right
    lazy var rightButton: UIBarButtonItem = {
        let button = UIBarButtonItem(title: "새 메모", style: .plain, target: self, action: #selector(secondButtonPressed(_:)))
        
        return button
    }()
    
    
    // ListView (삭제예정)
    let listView: MemoListView = {
        let listView = MemoListView()
        return listView
    }()
    
    
    // CollectionView
    private var memolistCollectionView: MemoListCollectionView!
    private let data = Data()

    // viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "메모 목록"
        
        self.navigationItem.leftBarButtonItem = self.leftButton
        self.navigationItem.rightBarButtonItem = self.rightButton
        
        /*
        listView.firstButton.addTarget(self, action: #selector(firstButtonPressed(_:)), for: .touchUpInside)
        listView.secondButton.addTarget(self, action: #selector(secondButtonPressed(_:)), for: .touchUpInside)
        */
        
        configureCollectionView()
        registerCollectionView()
        collectionViewDelegate()
    }
    
    override func loadView() {
        super.loadView()
        view = listView
    }
    
    
    @objc private func buttonPressed(_: UIBarButtonItem) {
        let actionSheet = UIAlertController(title: "정렬", message: "선택한 기준으로 리스트가 정렬됩니다", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "제목", style: .default, handler: {(ACTION:UIAlertAction) in print("제목 순으로 정렬합니다.")
        }))
        
        actionSheet.addAction(UIAlertAction(title: "생성일자", style: .default, handler: {(ACTION:UIAlertAction) in print("생성일자 순으로 정렬합니다.")
        }))
        
        actionSheet.addAction(UIAlertAction(title: "최종 수정일자", style: .default, handler: {(ACTION:UIAlertAction) in print("최종 수정일자 순으로 정렬합니다.")
        }))
        
        actionSheet.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
        
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    @objc func firstButtonPressed(_: UIButton) {
        print("pushViewController -> MemoContentsView")
        let contentsViewController = MemoContentsViewController()
        navigationController?.pushViewController(contentsViewController, animated: true)
    }
    
    @objc func secondButtonPressed(_: UIButton) {
        print("pushViewController -> MemoEditiorView")
        let editorViewController = MemoEditorViewController()
        navigationController?.pushViewController(editorViewController, animated: true)
    }
    
    func configureCollectionView() {
        memolistCollectionView = MemoListCollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        memolistCollectionView.translatesAutoresizingMaskIntoConstraints = false
        memolistCollectionView.backgroundColor = .white
        self.view.addSubview(memolistCollectionView)
        memolistCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
        memolistCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        memolistCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        memolistCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
    }
    
    func registerCollectionView() {
        memolistCollectionView.register(MemoListCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "cellIdentifier")
    }
    
    func collectionViewDelegate() {
        memolistCollectionView.delegate = self
        memolistCollectionView.dataSource = self
    }
    
}

extension MemoListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.title.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellIdentifier", for: indexPath) as! MemoListCollectionViewCell
        
        cell.titleLabel.text = data.title[indexPath.row]
        return cell
    }
}



// for Canvas
import SwiftUI

struct MemoViewControllerRepresentable: UIViewControllerRepresentable {
    typealias UIViewControllerType = MemoListViewController

    func makeUIViewController(context: Context) -> MemoListViewController {
        return MemoListViewController()
    }

    func updateUIViewController(_ uiViewController: MemoListViewController, context: Context) {
    }
}

@available(iOS 13.0.0, *)
struct ViewPreview: PreviewProvider {
    static var previews: some View {
        MemoViewControllerRepresentable()
    }
}
