//
//  ChatTableViewCell.swift
//  sopt-37th-semina01
//
//  Created by 이나연 on 11/1/25.
//

import UIKit

import SnapKit
import Then

class ChatTableViewCell: UITableViewCell {

    static let identifier: String = "ChatTableViewCell"
    
    private let profileImageView = UIImageView()
    private let nameLabel = UILabel()
    private let locationLabel = UILabel()
    private let messageLabel = UILabel()
    private let thumbnailImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        setLayout()
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        addSubviews(profileImageView, nameLabel, locationLabel, messageLabel, thumbnailImageView)
    }
    
    private func setLayout() {
        profileImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.leading.equalToSuperview().inset(16)
            $0.width.height.equalTo(48)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16.5)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(16)
        }
        
        locationLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(18.5)
            $0.leading.equalTo(nameLabel.snp.trailing).offset(4)
        }
        
        messageLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(4)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(16)
        }
        
        thumbnailImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.leading.equalToSuperview().inset(16)
            $0.width.height.equalTo(48)
        }
    }
    
    private func setStyle() {
        profileImageView.do {
            $0.contentMode = .scaleAspectFill
        }
        
        nameLabel.do {
            $0.font = .subhead3
            $0.textColor = .black
        }
        
        locationLabel.do {
            $0.font = .info12
            $0.textColor = .gray
        }
        
        messageLabel.do {
            $0.font = .subhead5
            $0.textColor = .black
        }
        
        thumbnailImageView.do {
            $0.contentMode = .scaleAspectFill
        }
    }
}


extension ChatTableViewCell {
    func configure(chatRoom: ChatRoomModel) {
        profileImageView.image = chatRoom.profileImage
        nameLabel.text = chatRoom.name
        locationLabel.text = chatRoom.location
        messageLabel.text = chatRoom.lastMessage
        thumbnailImageView.image = chatRoom.thumbnail
    }
}
