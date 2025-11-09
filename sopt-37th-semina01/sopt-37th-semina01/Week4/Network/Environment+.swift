//
//  Environment+.swift
//  sopt-37th-semina01
//
//  Created by 이나연 on 11/8/25.
//

import Foundation

enum Environment {
  static let baseURL: String = Bundle.main.infoDictionary?["BASE_URL"] as! String
}
