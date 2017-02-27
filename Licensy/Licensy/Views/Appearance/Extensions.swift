//
//  Extensions.swift
//  Licensy
//
//  Created by David Jiménez Guinaldo on 23/2/17.
//  Copyright © 2017 RetoLabs. All rights reserved.
//

import UIKit

fileprivate var bundle: Bundle {
    let podBundle =  Bundle(for: LibraryEntity.self)
    let bundleURL = podBundle.url(forResource: "Licensy", withExtension: "bundle")
    return Bundle(url: bundleURL!)!
}

extension UIButton {
    func setBackgroundColor(color: UIColor, forState state: UIControlState) {
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        UIGraphicsGetCurrentContext()!.setFillColor(color.cgColor)
        UIGraphicsGetCurrentContext()!.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
        let colorImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        self.setBackgroundImage(colorImage, for: state)
    }
}

extension UIView {
    func rotate(_ toValue: CGFloat, duration: CFTimeInterval = 0.2) {
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        
        animation.toValue = toValue
        animation.duration = duration
        animation.isRemovedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        
        self.layer.add(animation, forKey: nil)
    }
}

extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: bundle, value: "", comment: "")
    }
}
