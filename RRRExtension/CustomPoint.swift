//
//  CustomPoint.swift
//  RRRExtensionDemo
//
//  Created by RRRenj on 2021/2/23.
//

import UIKit

extension CGPoint {
    func add(_ point : CGPoint) -> CGPoint {
        return CGPoint(x: self.x + point.x, y: self.y + point.y)
    }
    
    func multiple(_ scale : CGFloat) -> CGPoint{
        return CGPoint(x: self.x * scale, y: self.y * scale)
    }
}
