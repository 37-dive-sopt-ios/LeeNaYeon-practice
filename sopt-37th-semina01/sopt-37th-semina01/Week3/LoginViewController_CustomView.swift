//
//  LoginViewController_Snapkit.swift
//  sopt-37th-semina01
//
//  Created by 이나연 on 10/18/25.
//

import UIKit

import SnapKit

final class LoginViewController_CustomView: UIViewController {
    private let rootView = LoginView()
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAddTarget()
    }
    
    private func setAddTarget() {
        rootView.loginButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
    }
}

extension LoginViewController_CustomView {
    @objc
    private func loginButtonDidTap() {
//        presentToWelcomeVC()
        pushToWelcomeVC()
    }
    
    private func presentToWelcomeVC() {
        let welcomeViewController = WelcomeViewController_Closure()
        welcomeViewController.id = rootView.idTextField.text
        welcomeViewController.modalPresentationStyle = .formSheet
        welcomeViewController.completionHandler = { [weak self] message in
            self?.rootView.titleLabel.text = message
            self?.rootView.idTextField.text = ""
        }
        self.present(welcomeViewController, animated: true)
    }
    
    private func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController_Closure()
        welcomeViewController.id = rootView.idTextField.text
        welcomeViewController.completionHandler = { [weak self] message in
            self?.rootView.titleLabel.text = message
            self?.rootView.idTextField.text = ""
            self?.rootView.loginButton.setTitle("다시 로그인하기", for: .normal)
        }
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
}
