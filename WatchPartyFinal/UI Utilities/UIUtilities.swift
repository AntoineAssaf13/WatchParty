//
//  UIUtilities.swift
//  WatchPartyFinal
//
//  Created by Antoine Assaf on 4/28/20.
//  Copyright © 2020 Nikhil Vaidyamath. All rights reserved.
//

import Foundation
import UIKit

class UIUtilities{
    static func styleTextField(_ textfield:UITextField){
        
        let bottomLine = CALayer()
        
        bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - 2, width: textfield.frame.width, height:2)
        
        bottomLine.backgroundColor = UIColor.init(red:255/255, green: 0/255, blue: 0/255, alpha:1).cgColor
        
        textfield.borderStyle = .none
        
        textfield.layer.addSublayer(bottomLine)
    }
        
    static func styleFilledButton(_ button:UIButton) {
        
        // Filled rounded corner style
        button.backgroundColor = UIColor.init(red: 255/255, green: 165/255, blue: 0/255, alpha: 1)
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.white
    }
    
    static func styleHollowButton(_ button:UIButton) {
        
        // Hollow rounded corner style
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.black
    }
    
    static func styleFilledButtonParty(_ button:UIButton) {
        
        // Hollow rounded corner style
        button.backgroundColor = UIColor.init(red: 255/255, green: 165/255, blue: 0/255, alpha: 0.85)
        //button.layer.borderColor = UIColor.orange.cgColor
        button.layer.cornerRadius = 13.0
        button.tintColor = UIColor.white
    }
    
    static func labelDesigner(_ label:UILabel) {
        
        // Hollow rounded corner style
//        button.backgroundColor = UIColor.init(red: 255/255, green: 165/255, blue: 0/255, alpha: 0.85)
//        //button.layer.borderColor = UIColor.orange.cgColor
//        button.layer.cornerRadius = 25.0
//        button.tintColor = UIColor.white
    }
    
    
}
