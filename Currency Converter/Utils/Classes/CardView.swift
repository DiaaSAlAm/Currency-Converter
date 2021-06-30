//
//  CardView.swift
//  Currency Converter
//
//  Created by Diaa SAlAm on 6/30/21.
//

import UIKit

class CardView: UIView {
    
    @IBInspectable var cornerrRadius: CGFloat = 6
    @IBInspectable var shadowOffSetWidth: CGFloat = 2
    @IBInspectable var shadowOffSetHeight: CGFloat = 3
    @IBInspectable var shadowOpacity: CGFloat = 0.5
    @IBInspectable var shadowColor = UIColor.gray
    @IBInspectable var borderWidth : CGFloat = 0.0
    @IBInspectable var borderColor : UIColor?
    
    override func layoutSubviews() {
        layer.cornerRadius = cornerrRadius
        layer.shadowColor = shadowColor.cgColor
        
        layer.shadowOffset = CGSize(width: shadowOffSetWidth, height: shadowOffSetHeight)
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerrRadius)
        layer.shadowPath = shadowPath.cgPath
        layer.shadowOpacity = Float(shadowOpacity)
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor?.cgColor
    }
    
}
