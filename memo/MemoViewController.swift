//
//  ContentView.swift
//  memo
//
//  Created by 최한호 on 2021/08/30.
//
import UIKit
import SnapKit

class MemoViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTestLabel()
        configureTestButton()
    }
    
    func configureTestButton() {
        let testButton = UIButton()
        testButton.setTitle("정렬", for: .normal)
        testButton.backgroundColor = .purple
        testButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(testButton)
        
        let safeArea = view.safeAreaLayoutGuide
        
        testButton.snp.makeConstraints { make in
            make.leading.equalTo(20)
            make.bottom.equalTo(-20)
            make.trailing.equalTo(-20)
        }
        
    }
    
    func configureTestLabel() {
        let testLabel = UILabel()
        testLabel.text = "UIButton 테스트 중입니다. \nmade by 최한호"
        testLabel.translatesAutoresizingMaskIntoConstraints = false
        testLabel.textColor = .systemPink
        testLabel.numberOfLines = 0
    }
}









// for Canvas
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
