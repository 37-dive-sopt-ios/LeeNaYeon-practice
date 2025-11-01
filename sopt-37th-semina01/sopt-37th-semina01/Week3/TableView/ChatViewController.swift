//
//  ChatViewController.swift
//  sopt-37th-semina01
//
//  Created by 이나연 on 11/1/25.
//

import UIKit

import SnapKit
import Then

final class ChatViewController: UIViewController {
    private let tableView = UITableView()
    private var chatRooms: [ChatRoomModel] = []
    
    override func viewDidLoad() {
        setUI()
        setLayout()
        setDelegate()
        register()
        setData()
    }
    
    private func setUI() {
        self.view.addSubview(tableView)
        title = "채팅"
        tableView.separatorStyle = .singleLine  
    }
    
    private func setLayout() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func register() {
        tableView.register(ChatTableViewCell.self, forCellReuseIdentifier: ChatTableViewCell.identifier)
    }
    
    private func setData() {
        chatRooms = ChatRoomModel.mockData
        tableView.reloadData()
    }
}

extension ChatViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(chatRooms[indexPath.row]) 채팅방 선택")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChatTableViewCell.identifier, for: indexPath) as? ChatTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(chatRoom: chatRooms[indexPath.row])
        return cell
    }
}

