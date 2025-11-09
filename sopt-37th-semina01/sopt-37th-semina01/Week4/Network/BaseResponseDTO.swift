//
//  BaseResponseDTO.swift
//  sopt-37th-semina01
//
//  Created by 이나연 on 11/8/25.
//

import Foundation

public struct BaseResponseDTO<T: Decodable>: Decodable {
    public let success: Bool
    public let code: String
    public let message: String?
    public let data: T?
}

public struct EmptyResponseDTO: Decodable {
    public init() {}
}
