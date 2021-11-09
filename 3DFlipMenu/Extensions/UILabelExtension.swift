//
//  UILabelExtension.swift
//  3DFlipMenu
//
//  Created by Rachit Prajapati on 10/11/21.
//

import Foundation
import UIKit

extension UILabel {
    static func createMenuItem(name: String, color: UIColor = .black, size: CGFloat) -> UILabel {
        let label = UILabel()
        label.text = name
        label.font = UIFont(name: "BlackRocker", size: size)
        label.textColor = color
        return label
    }
}
