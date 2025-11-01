//
//  UIView+.swift
//  sopt-37th-semina01
//
//  Created by 이나연 on 11/1/25.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}
