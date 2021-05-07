//
//  RoundedCorners.swift
//  Dares
//
//  Created by Mohamed Hafez on 5/7/21.
//

import UIKit

extension UIView {
    func roundCorners(radius: CGFloat) {
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }
}
