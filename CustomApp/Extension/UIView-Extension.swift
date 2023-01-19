//
//  UIView-Extension.swift
//  CustomApp
//
//  Created by Şükrü Özkoca on 5.01.2023.
//

import Foundation
import UIKit

extension UIView{
    func rotate() {
        let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.toValue = NSNumber(value: Double.pi * 2)
        rotation.duration = 1
        rotation.isCumulative = true
        rotation.repeatCount = Float.greatestFiniteMagnitude
        self.layer.add(rotation, forKey: "rotationAnimation")
    }
}

extension UIView {
     func rotate360Degrees(duration: CFTimeInterval = 1.0, completionDelegate: AnyObject? = nil) {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat(M_PI * 2.0)
        rotateAnimation.duration = duration
 
        if let delegate: AnyObject = completionDelegate {
            rotateAnimation.delegate = delegate as! any CAAnimationDelegate
        }
         self.layer.add(rotateAnimation, forKey: nil)
    }
}
extension UIView {
    func rotateWithAnimation(angle: CGFloat, duration: CGFloat? = nil) {
        let pathAnimation = CABasicAnimation(keyPath: "transform.rotation")
        pathAnimation.duration = CFTimeInterval(duration ?? 2.0)
        pathAnimation.fromValue = 0
        pathAnimation.toValue = angle
        pathAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        self.transform = transform.rotated(by: angle)
        self.layer.add(pathAnimation, forKey: "transform.rotation")
    }
}

