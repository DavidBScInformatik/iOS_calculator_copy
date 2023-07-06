//
//  RoundButton.swift
//  iOS_Taschenrechner
//
//  Created by Turk on 06.07.23.
//

import UIKit

@IBDesignable
class RoundButton: UIButton {

    @IBInspectable var roundButton: Bool = false{
        didSet {
            if roundButton == true {
                layer.cornerRadius = frame.height / 2;
            }
        }
    }
    
    override func prepareForInterfaceBuilder() {
        if roundButton == true {
            layer.cornerRadius = frame.height / 2;
        }
    }
    
}
