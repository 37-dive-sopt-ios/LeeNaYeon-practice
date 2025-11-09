//
//  RegisterRequestDTO.swift
//  sopt-37th-semina01
//
//  Created by 이나연 on 11/8/25.
//

import Foundation

struct RegisterRequestDTO: Encodable {
    let username: String
    let password: String
    let name: String
    let email: String
    let age: Int
}
