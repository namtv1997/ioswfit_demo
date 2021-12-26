//
//  CardView.swift
//  Fintech
//
//  Created by Ta Noah on 10/12/2021.
//

import Foundation
import UIKit

@IBDesignable class CardView : UIView{
    @IBInspectable var cornerRadius : CGFloat = 10
    @IBInspectable var colour : UIColor = UIColorFromHex(rgbValue: 0xADADAD)
    
    var offsetWidth : CGFloat = 1
    var offsetHeight : CGFloat = 4
    var offsetShadowOpacity : Float = 10
    
    override func layoutSubviews() {
        layer.cornerRadius = self.cornerRadius
        layer.shadowColor = self.colour.cgColor
        layer.shadowOffset = CGSize(width: self.offsetWidth, height: self.offsetHeight)
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: self.cornerRadius).cgPath
        layer.shadowOpacity = self.offsetShadowOpacity
        
    }
}
