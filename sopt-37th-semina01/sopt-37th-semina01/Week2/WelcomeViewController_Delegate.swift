//
//  WelcomeViewController.swift
//  sopt-37th-semina01
//
//  Created by 이나연 on 10/13/25.
//

import UIKit

protocol WelcomeReloginDelegate: AnyObject {
    func retryLogin(didTapReloginWith message: String)
}

final class WelcomeViewController_Delegate: UIViewController {
    
    var id: String?
    
    weak var delegate: WelcomeReloginDelegate?

    private let logoImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 112, y: 87, width: 150, height: 150))
        imageView.image = .logo2
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 140, y: 295, width: 110, height: 60))
        label.text = "???님 \n반가워요!"
        label.font = .head1
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    private var goHomeButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 426, width: 335, height: 58))
        button.backgroundColor = .primaryOrange
        button.setTitle("메인으로", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .subhead1
        return button
    }()
    
    private lazy var backToLoginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 498, width: 335, height: 58))
        button.backgroundColor = .grey200
        button.setTitle("다시 로그인", for: .normal)
        button.setTitleColor(.grey300, for: .normal)
        button.titleLabel?.font = .subhead1
        button.addTarget(self, action: #selector(backButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        setLayout()
        bindID()
    }
    
    private func setLayout() {
        [logoImageView, welcomeLabel, goHomeButton, backToLoginButton].forEach {
            self.view.addSubview($0)
        }
    }
}

extension WelcomeViewController_Delegate {
    @objc
    private func backButtonDidTap() {
        delegate?.retryLogin(didTapReloginWith: "다시 로그인했어요")
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    private func bindID() {
        if let id = id {
            if id.isEmpty {
                welcomeLabel.text = "이름없음님 \n반가워요!"
            } else {
                welcomeLabel.text = "\(id)님 \n반가워요!"
            }
        }
    }
}
