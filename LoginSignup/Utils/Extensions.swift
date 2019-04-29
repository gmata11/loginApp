//
//  Extensions.swift
//  LoginSignup
//
//  Created by Gerard Mata Carrera on 26/01/2019.
//  Copyright © 2019 Gerard Mata Carrera. All rights reserved.
//

import UIKit

extension UIColor {
    static func rgb(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor{
        return UIColor(displayP3Red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}//End UIColor

extension UITextField{
    
    func setBottomBorder(backGroundColor: UIColor, borderColor: UIColor){
        self.layer.backgroundColor = backGroundColor.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.1)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
        self.layer.shadowColor = borderColor.cgColor
    }
    
}//End UITextField
