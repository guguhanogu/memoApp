//
//  MemoEditorViewController.swift
//  memo
//
//  Created by 최한호 on 2021/09/17.
//

import Foundation
import UIKit
import SnapKit


class MemoEditorViewController: UIViewController{
    
    let editorView: MemoEditorView = {
        let editorView = MemoEditorView()
        return editorView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "메모 작성"
        editorView.firstButton.addTarget(self, action: #selector(firstButtonPressed(_:)), for: .touchUpInside)
        editorView.secondButton.addTarget(self, action: #selector(secondButtonPressed(_:)), for: .touchUpInside)
    }
    
    override func loadView() {
        super.loadView()
        view = editorView
    }
    
    @objc func firstButtonPressed(_: UIButton) {
        print("popViewController -> viewControllers[0]")
        guard let secondViewController = self.navigationController?.viewControllers[0] else { return }
        navigationController?.popToViewController(secondViewController, animated: true)
    }
    
    @objc func secondButtonPressed(_: UIButton) {
        print("popToRootViewController -> rootViewController")
        navigationController?.popToRootViewController(animated: true)
    }

}
