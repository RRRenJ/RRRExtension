//
//  CustomSize.swift
//  RRRExtensionDemo
//
//  Created by RRRenj on 2021/2/23.
//

import UIKit

extension CGSize {

    func add(_ size : CGSize) -> CGSize {
        return CGSize(width: self.width + size.width, height: self.height + size.height)
    }
    
    func multiple(_ scale : CGFloat) -> CGSize{
        return CGSize(width: self.width * scale, height: self.height * scale)
    }
    
}
