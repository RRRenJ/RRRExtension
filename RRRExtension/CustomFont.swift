//
//  CustomFont.swift
//  RRRExtensionDemo
//
//  Created by 任敬 on 2020/11/14.
//  Copyright © 2020 任敬. All rights reserved.
//

import UIKit

public extension UIFont {
    
    class func pingfangFont(size : CGFloat, weight : UIFont.Weight) -> UIFont {
        var font : UIFont!
        switch weight {
        case .thin:
            font = UIFont(name: "PingFangSC-Thin", size: size)
        case .ultraLight:
            font = UIFont(name: "PingFangSC-Ultralight", size: size)
        case .light:
            font = UIFont(name: "PingFangSC-Light", size: size)
        case .regular:
            font = UIFont(name: "PingFangSC-Regular", size: size)
        case .medium:
            font = UIFont(name: "PingFangSC-Medium", size: size)
        case .semibold:
            font = UIFont(name: "PingFangSC-Semibold", size: size)
        default:
            font = UIFont(name: "PingFangSC-Regular", size: size)
        }
        guard font != nil else {
            return UIFont(name: "PingFangSC-Regular", size: size)!
        }
        return font!
    }
    
    class func pingfangFont(size : CGFloat) -> UIFont {
        return UIFont(name: "PingFangSC-Regular", size: size)!
    }
}
