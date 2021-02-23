//
//  CustomRect.swift
//  RRRExtensionDemo
//
//  Created by RRRenj on 2021/2/23.
//

import UIKit

extension CGRect {
    func overlap(_ rect : CGRect) -> (Bool,Bool) {
        var x = true
        var y = true
        if minX > rect.maxX || maxX < rect.minX {
            x = false
        }
        if minY > rect.maxY || maxY < rect.minY {
            y = false
        }
        return (x,y)
    }
    
    func offsetCenter(_ rect : CGRect) -> CGPoint {
        .init(x: self.centerX - rect.centerX, y: self.centerY - rect.centerY)
    }
    
    var centerY : CGFloat {
        return maxY - height / 2
    }
    
    var centerX : CGFloat {
        return maxX - width / 2
    }
    
    func union(_ rect : CGRect) -> CGRect {
        var result = CGRect()
        result.origin.x = min(minX, rect.minX)
        result.origin.y = min(minY, rect.minY)
        
        let unionMaxX = max(maxX,rect.maxX)
        let unionMaxY = max(maxY,rect.maxY)
        result.size.width = unionMaxX - result.origin.x
        result.size.height = unionMaxY - result.origin.y
        return result
    }
    
    func multiple(_ scale : CGFloat) -> CGRect{
        return CGRect(x: self.minX * scale, y: self.minY * scale, width: self.width * scale, height: self.height * scale)
    }
}
