//
//  ContentView.swift
//  memo
//
//  Created by 최한호 on 2021/08/30.
//
/*
import UIKit
import SnapKit

class FirstView: UIView {
    
    let firstButton: UIButton = {
        let firstButton = UIButton()
        firstButton.setTitle("Go to SecondView", for: .normal)
        firstButton.isUserInteractionEnabled = true
        firstButton.backgroundColor = .cyan
        firstButton.titleLabel?.textColor = .white
        
        return firstButton
    }()
    
    let secondButton: UIButton = {
        let secondButton = UIButton()
        secondButton.setTitle("Go to ThirdView", for: .normal)
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


class SecondView: UIView {
    
    let firstButton: UIButton = {
        let firstButton = UIButton()
        firstButton.setTitle("Go to ThirdView", for: .normal)
        firstButton.isUserInteractionEnabled = true
        firstButton.backgroundColor = .cyan
        firstButton.titleLabel?.textColor = .white
        
        return firstButton
    }()
    
    let secondButton: UIButton = {
        let secondButton = UIButton()
        secondButton.setTitle("Back to FirstView", for: .normal)
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

class ThirdView: UIView {
    
    let firstButton: UIButton = {
        let firstButton = UIButton()
        firstButton.setTitle("popToViewController", for: .normal)
        firstButton.isUserInteractionEnabled = true
        firstButton.backgroundColor = .cyan
        firstButton.titleLabel?.textColor = .white
        
        return firstButton
    }()
    
    let secondButton: UIButton = {
        let secondButton = UIButton()
        secondButton.setTitle("popToRootViewController", for: .normal)
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


class MemoViewController: UIViewController{
    
    let firstView: FirstView = {
        let firstView = FirstView()
        return firstView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "메모"
        firstView.firstButton.addTarget(self, action: #selector(firstButtonPressed(_:)), for: .touchUpInside)
        firstView.secondButton.addTarget(self, action: #selector(secondButtonPressed(_:)), for: .touchUpInside)
    }
    
    override func loadView() {
        super.loadView()
        view = firstView
    }
    
    @objc func firstButtonPressed(_: UIButton) {
        print("pushViewController -> secondView")
        let secondViewController = SecondViewController()
        navigationController?.pushViewController(secondViewController, animated: true)
    }
    
    @objc func secondButtonPressed(_: UIButton) {
        print("pushViewController -> thirdView")
        let thirdViewController = ThirdViewController()
        navigationController?.pushViewController(thirdViewController, animated: true)
    }
    
}


class SecondViewController: UIViewController{
    
    let secondView: SecondView = {
        let secondView = SecondView()
        return secondView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "SecondViewController"
        secondView.firstButton.addTarget(self, action: #selector(firstButtonPressed(_:)), for: .touchUpInside)
        secondView.secondButton.addTarget(self, action: #selector(secondButtonPressed(_:)), for: .touchUpInside)
    }
    
    override func loadView() {
        super.loadView()
        view = secondView
    }
    
    @objc func firstButtonPressed(_: UIButton) {
        print("pushViewController -> thirdView")
        let thirdViewController = ThirdViewController()
        navigationController?.pushViewController(thirdViewController, animated: true)
    }
    
    @objc func secondButtonPressed(_: UIButton) {
        print("popViewController -> firstView")
        navigationController?.popViewController(animated: true)
    }
}

class ThirdViewController: UIViewController{
    
    let thirdView: ThirdView = {
        let thirdView = ThirdView()
        return thirdView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "ThirdViewController"
        thirdView.firstButton.addTarget(self, action: #selector(firstButtonPressed(_:)), for: .touchUpInside)
        thirdView.secondButton.addTarget(self, action: #selector(secondButtonPressed(_:)), for: .touchUpInside)
    }
    
    override func loadView() {
        super.loadView()
        view = thirdView
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

*/
