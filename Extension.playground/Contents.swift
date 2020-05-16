//
//  UIColor+hexRgbConstructor.swift
//  Milk
//
//  Created by Danielle Gomes on 2019-10-08.
//  Copyright © 2019 Derrick Park. All rights reserved.
//
import UIKit

extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
    
    
}


struct AnchoredConstraints {
    var top, leading, bottom, trailing, width, height: NSLayoutConstraint?
}

extension UIView {
    func matchParent(padding: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superTopAnchor = superview?.topAnchor {
            self.topAnchor.constraint(equalTo: superTopAnchor, constant: padding.top).isActive = true
        }
        if let superBottomAnchor = superview?.bottomAnchor {
            self.bottomAnchor.constraint(equalTo: superBottomAnchor, constant: -padding.bottom).isActive = true
        }
        if let superLeadingAnchor = superview?.leadingAnchor {
            self.leadingAnchor.constraint(equalTo: superLeadingAnchor, constant: padding.left).isActive = true
        }
        if let superTrailingAnchor = superview?.trailingAnchor {
            self.trailingAnchor.constraint(equalTo: superTrailingAnchor, constant: -padding.right).isActive = true
        }
    }
    
    @discardableResult
    func anchors(topAnchor: NSLayoutYAxisAnchor?, leadingAnchor: NSLayoutXAxisAnchor?, trailingAnchor: NSLayoutXAxisAnchor?, bottomAnchor: NSLayoutYAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) -> AnchoredConstraints {
        
        translatesAutoresizingMaskIntoConstraints = false
        var anchoredConstraints = AnchoredConstraints()
        if let topAnchor = topAnchor {
            anchoredConstraints.top = self.topAnchor.constraint(equalTo: topAnchor, constant: padding.top)
        }
        if let bottomAnchor = bottomAnchor {
            anchoredConstraints.bottom = self.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding.bottom)
        }
        if let leadingAnchor = leadingAnchor {
            anchoredConstraints.leading = self.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding.left)
        }
        if let trailingAnchor = trailingAnchor {
            anchoredConstraints.trailing = self.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding.right)
        }
        if size.width != 0 {
            anchoredConstraints.width = self.widthAnchor.constraint(equalToConstant: size.width)
        }
        if size.height != 0 {
            anchoredConstraints.height = self.heightAnchor.constraint(equalToConstant: size.height)
        }
        
        [anchoredConstraints.top, anchoredConstraints.bottom, anchoredConstraints.leading, anchoredConstraints.trailing, anchoredConstraints.width, anchoredConstraints.height].forEach { $0?.isActive = true }
        
        return anchoredConstraints
    }
    
    func constraintWidth(equalToConstant: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: equalToConstant).isActive = true
    }
    
    func constraintHeight(equalToConstant: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: equalToConstant).isActive = true
    }
    
    func constraintWidth(equalToConstant: CGFloat, heightEqualToConstant: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: equalToConstant).isActive = true
        self.heightAnchor.constraint(equalToConstant: heightEqualToConstant).isActive = true
    }
    
    func matchSize() {
        if let superWidthAnchor = superview?.widthAnchor {
            self.widthAnchor.constraint(equalTo: superWidthAnchor).isActive = true
        }
        if let superHeightAnchor = superview?.heightAnchor {
            self.heightAnchor.constraint(equalTo: superHeightAnchor).isActive = true
        }
    }
    
    func centerXYin(_ view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        self.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        self.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
}
