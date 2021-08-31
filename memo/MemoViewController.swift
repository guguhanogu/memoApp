//
//  ContentView.swift
//  memo
//
//  Created by 최한호 on 2021/08/30.
//
import UIKit

class MemoViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let testLabel = UILabel()
        
        testLabel.text = "테스트 중입니다."
        testLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(testLabel)
        
        let safeArea = view.safeAreaLayoutGuide
        
        testLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16).isActive = true
        testLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16).isActive = true
        
    }
    
}










import SwiftUI

struct MemoViewControllerRepresentable: UIViewControllerRepresentable {
    typealias UIViewControllerType = MemoViewController

    func makeUIViewController(context: Context) -> MemoViewController {
        return MemoViewController()
    }

    func updateUIViewController(_ uiViewController: MemoViewController, context: Context) {
    }
}

@available(iOS 13.0.0, *)
struct ViewPreview: PreviewProvider {
    static var previews: some View {
        MemoViewControllerRepresentable()
    }
}
