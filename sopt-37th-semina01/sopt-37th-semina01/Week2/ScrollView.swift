//
//  ScrollView.swift
//  sopt-37th-semina01
//
//  Created by 이나연 on 10/18/25.
//

import UIKit

import SnapKit
import Then

final class ScrollViewController: UIViewController {
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let redView = UIView()
    private let orangeView = UIView()
    private let yellowView = UIView()
    private let greenView = UIView()
    private let blueView = UIView()
    private let purpleView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setStyle()
        setLayout()
    }
    
    private func setStyle() {
        redView.do {
            $0.backgroundColor = .red
        }
        
        orangeView.do {
            $0.backgroundColor = .orange
        }
        
        yellowView.do {
            $0.backgroundColor = .yellow
        }
        
        greenView.do {
            $0.backgroundColor = .green
        }
        
        blueView.do {
            $0.backgroundColor = .blue
        }
        
        purpleView.do {
            $0.backgroundColor = .purple
        }
    }
    
    private func setLayout(){
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        [redView, orangeView, yellowView, greenView, blueView, purpleView].forEach {
            contentView.addSubview($0)
        }
        
        let colorViewHeight: CGFloat = 300
        let colorViewWidth: CGFloat = view.frame.width * 0.5
        
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.greaterThanOrEqualToSuperview().priority(.low)
        }
        
        redView.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.width.equalTo(colorViewWidth)
            $0.height.equalTo(colorViewHeight)
        }
        
        orangeView.snp.makeConstraints {
            $0.top.trailing.equalToSuperview()
            $0.width.equalTo(colorViewWidth)
            $0.height.equalTo(colorViewHeight)
        }
        
        yellowView.snp.makeConstraints {
            $0.top.equalTo(redView.snp.bottom)
            $0.leading.equalToSuperview()
            $0.width.equalTo(colorViewWidth)
            $0.height.equalTo(colorViewHeight)
        }
        
        greenView.snp.makeConstraints {
            $0.top.equalTo(redView.snp.bottom)
            $0.trailing.equalToSuperview()
            $0.width.equalTo(colorViewWidth)
            $0.height.equalTo(colorViewHeight)
        }
        
        blueView.snp.makeConstraints {
            $0.top.equalTo(yellowView.snp.bottom)
            $0.leading.equalToSuperview()
            $0.width.equalTo(colorViewWidth)
            $0.height.equalTo(colorViewHeight)
            $0.bottom.equalTo(contentView)
        }
        
        purpleView.snp.makeConstraints {
            $0.top.equalTo(yellowView.snp.bottom)
            $0.trailing.equalToSuperview()
            $0.width.equalTo(colorViewWidth)
            $0.height.equalTo(colorViewHeight)
            $0.bottom.equalTo(contentView)
        }
    }
}
