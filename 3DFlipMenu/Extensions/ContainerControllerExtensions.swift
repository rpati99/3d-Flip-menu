//
//  Animations.swift
//  3DFlipMenu
//
//  Created by Rachit Prajapati on 10/11/21.
//

import Foundation
import UIKit

extension ContainerController {
    
    func setMenu(toPercent percent: CGFloat) {
        moveGuitar(toPercent: percent)
        fenderViewController.view.layer.transform = fenderTransform(percent: percent )
        menuViewController.view.layer.transform = menuTransform(percent: percent)
    }
    
    func moveGuitar(toPercent percent: CGFloat) {
        let newYAngle: Float = 1.62
        geometryNode.eulerAngles.y = newYAngle * Float(percent)
        geometryNode.position.x = newYAngle * Float(percent) * -0.5
    }
    
    func menuTransform(percent: CGFloat) -> CATransform3D {
        var identity = CATransform3DIdentity
        identity.m34 = -1.0 / 1000
     let remainingPercent = 1.0 - percent
       let angle = remainingPercent * .pi * -0.5
        let rotationTransform = CATransform3DRotate(
          identity, angle, 0.0, 1.0, 0.0)
        let translationTransform = CATransform3DMakeTranslation(
            menuWidth * percent, 0, 0)
       
        return CATransform3DConcat(rotationTransform, translationTransform)
    }
    
    func fenderTransform(percent: CGFloat) -> CATransform3D {
        var identity = CATransform3DIdentity
        identity.m34 = -1.0 / 1000
        let angle = percent * .pi / 2
        let rotationTransform = CATransform3DRotate(identity, angle, 0.0, 1.0, 0.0)
        let translationTransform = CATransform3DMakeTranslation(((self.view.frame.width - 100) - (self.view.frame.width / 2)) * percent, 0.0, 0.0)
      
        return CATransform3DConcat(rotationTransform, translationTransform)
    }
    

}
