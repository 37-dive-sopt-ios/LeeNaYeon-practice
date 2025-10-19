//
//  LoginViewController.swift
//  sopt-37th-semina01
//
//  Created by 이나연 on 10/13/25.
//

import UIKit

import SnapKit

final class LoginViewController_Closure: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "동네라서 가능한 모든것\n당근에서 가까운 이웃과 함께해요."
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = .subhead1
        return label
    }()
    
    private let idTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "아이디"
        textField.font = .subhead4
        textField.backgroundColor = .grey200
        textField.addLeftPadding()
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호"
        textField.isSecureTextEntry = true
        textField.font = .subhead4
        textField.backgroundColor = .grey200
        textField.addLeftPadding()
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .primaryOrange
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .subhead1
        button.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        setLayout()
    }
    
    private func setLayout() {
        [titleLabel, idTextField, passwordTextField, loginButton].forEach {
            self.view.addSubview($0)
        }
    }
}

extension LoginViewController_Closure {
    @objc
    private func loginButtonDidTap() {
//        presentToWelcomeVC()
        pushToWelcomeVC()
    }
    
    private func presentToWelcomeVC() {
        let welcomeViewController = WelcomeViewController_Closure()
        welcomeViewController.id = idTextField.text
        welcomeViewController.modalPresentationStyle = .formSheet
        welcomeViewController.completionHandler = { [weak self] message in
            self?.titleLabel.text = message
            self?.idTextField.text = ""
        }
        self.present(welcomeViewController, animated: true)
    }
    
    private func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController_Closure()
        welcomeViewController.id = idTextField.text
        welcomeViewController.completionHandler = { [weak self] message in
            self?.titleLabel.text = message
            self?.idTextField.text = ""
            self?.loginButton.setTitle("다시 로그인하기", for: .normal)
        }
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
}
