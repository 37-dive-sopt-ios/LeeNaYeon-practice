//
//  LoginViewController_Delegate.swift
//  sopt-37th-semina01
//
//  Created by 이나연 on 10/18/25.
//

import UIKit

final class LoginViewController_Delegate: UIViewController {
    
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
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 163),
                                     titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)])
        
        NSLayoutConstraint.activate([idTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                                     idTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 71),
                                     idTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                                     idTextField.heightAnchor.constraint(equalToConstant: 52)])
        
        
        NSLayoutConstraint.activate([passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                                     passwordTextField.topAnchor.constraint(equalTo: idTextField.bottomAnchor, constant: 7),
                                     passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                                     passwordTextField.heightAnchor.constraint(equalToConstant: 52)])
        
        NSLayoutConstraint.activate([loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                                     loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 35),
                                     loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                                     loginButton.heightAnchor.constraint(equalToConstant: 57)])
        
    }
}

extension LoginViewController_Delegate {
    @objc
    private func loginButtonDidTap() {
        //        presentToWelcomeVC()
        pushToWelcomeVC()
    }
    
    private func presentToWelcomeVC() {
        let welcomeViewController = WelcomeViewController_Delegate()
        welcomeViewController.id = idTextField.text
        welcomeViewController.modalPresentationStyle = .formSheet
        welcomeViewController.delegate = self
        self.present(welcomeViewController, animated: true)
    }
    
    private func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController_Delegate()
        welcomeViewController.id = idTextField.text
        welcomeViewController.delegate = self
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
}

extension LoginViewController_Delegate: WelcomeReloginDelegate {
    func retryLogin(didTapReloginWith message: String) {
        titleLabel.text = message
        idTextField.text = ""
        passwordTextField.text = ""
        loginButton.setTitle("다시 로그인하기", for: .normal)
    }
}
