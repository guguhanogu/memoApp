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
    
    let listView: MemoListView = {
        let listView = MemoListView()
        return listView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "메모 목록"
        listView.firstButton.addTarget(self, action: #selector(firstButtonPressed(_:)), for: .touchUpInside)
        listView.secondButton.addTarget(self, action: #selector(secondButtonPressed(_:)), for: .touchUpInside)
    }
    
    override func loadView() {
        super.loadView()
        view = listView
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
