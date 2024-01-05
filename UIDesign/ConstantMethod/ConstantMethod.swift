//
//  ConstantMethod.swift
//  UIDesign
//
//  Created by Pratiksha Jagtap on 23/11/23.
//

import Foundation
import UIKit
import SkyFloatingLabelTextField


// adding right side image or button to textField
struct ConstantMethod{
    
    static func text(textField: SkyFloatingLabelTextField, imageView: UIImageView){
        let rightSideButton  = UIButton(type: .custom)
        rightSideButton.frame = CGRect(x:5, y:10, width: 25, height:25)
        imageView.frame = CGRect(x: 5, y: 10, width: 25, height: 25)
        imageView.contentMode = .scaleAspectFit
        rightSideButton.addSubview(imageView)
        textField.rightViewMode = .always
        textField.rightView = rightSideButton
    }
    
}


