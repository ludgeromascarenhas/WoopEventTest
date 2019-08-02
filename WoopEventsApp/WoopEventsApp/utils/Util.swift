//
//  Util.swift
//  WoopEventsApp
//
//  Created by Ludgero Gil Mascarenhas on 01/08/19.
//  Copyright © 2019 Ludgero Gil Mascarenhas. All rights reserved.
//

import UIKit
import Foundation

class Util {
    
    static func alertMessage(controller: UIViewController, message: String, title: String?, okAction: UIAlertAction?=nil) {
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        if okAction != nil {
            alertController.addAction(okAction!)
        } else {
            let okAction = UIAlertAction(
                title: "Ok",
                style: .default,
                handler: nil
            )
            alertController.addAction(okAction)
        }
        
        controller.present(
            alertController,
            animated: true,
            completion: nil
        )
    }
}

extension DateFormatter {
    convenience init(dateFormat: String) {
        self.init()
        self.dateFormat = dateFormat
    }
}

extension UIView {
    
    public func setGrayBorder() {
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.gray.cgColor
    }
    
    public func setShadow() {
        self.layer.masksToBounds = false
        self.layer.shadowRadius = 10
        self.layer.shadowOffset = .zero
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOpacity = 1
        
        
    }
    
    
}
