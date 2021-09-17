//
//  MemoContentsViewController.swift
//  memo
//
//  Created by 최한호 on 2021/09/17.
//

import Foundation
import UIKit
import SnapKit


class MemoContentsViewController: UIViewController{
    
    let contentsView: MemoContentsView = {
        let contentsView = MemoContentsView()
        return contentsView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "메모 내용"
        contentsView.firstButton.addTarget(self, action: #selector(firstButtonPressed(_:)), for: .touchUpInside)
        contentsView.secondButton.addTarget(self, action: #selector(secondButtonPressed(_:)), for: .touchUpInside)
    }
    
    override func loadView() {
        super.loadView()
        view = contentsView
    }
    
    @objc func firstButtonPressed(_: UIButton) {
        print("pushViewController -> thirdView")
        let editorViewController = MemoEditorViewController()
        navigationController?.pushViewController(editorViewController, animated: true)
    }
    
    @objc func secondButtonPressed(_: UIButton) {
        print("popViewController -> MemoListView")
        navigationController?.popViewController(animated: true)
    }
}
