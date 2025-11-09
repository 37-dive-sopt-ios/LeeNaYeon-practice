//
//  UserDTO.swift
//  sopt-37th-semina01
//
//  Created by 이나연 on 11/8/25.
//

import Foundation

/// 사용자 정보 응답 모델
struct UserResponseDTO: Decodable {
    let id: Int
    let username: String
    let name: String
    let email: String
    let age: Int
    let status: String
}

/// 로그인 요청 모델
struct LoginRequestDTO: Encodable {
    let username: String
    let password: String
}

/// 로그인 응답 모델
struct LoginResponseDTO: Decodable {
    let userId: Int
    let message: String
}

/// 개인정보 수정 요청 모델
struct UpdateUserRequestDTO: Encodable {
    let name: String?
    let email: String?
    let age: Int?
}

