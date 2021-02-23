//
//  CustomView.swift
//  RRRExtensionDemo
//
//  Created by 任敬 on 2019/8/28.
//  Copyright © 2019 任敬. All rights reserved.
//

import UIKit

public extension UIView {

    func cutRound(radius:CGFloat, _ corners:UIRectCorner?, _ auto:Bool?) {
        let shapeLayer = CAShapeLayer()
        var path : UIBezierPath!
        if let _ = auto{
            if auto! {
                self.superview?.setNeedsLayout()
                self.superview?.layoutIfNeeded()
            }
        }
        if let _ = corners {
             path  = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners!, cornerRadii: CGSize(width: radius, height: radius))
            
        }else{
            path  = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: UIRectCorner.allCorners, cornerRadii: CGSize(width: radius, height: radius))
        }
      
        shapeLayer.path = path.cgPath
        self.layer.mask = shapeLayer
    }
    
    var size : CGSize{
        return self.frame.size
    }
    
    var height : CGFloat {
        return self.size.height
    }
    
    var width : CGFloat {
        return self.size.width
    }

}
