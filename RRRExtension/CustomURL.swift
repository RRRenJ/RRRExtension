//
//  CustomURL.swift
//  RRRExtensionDemo
//
//  Created by 任敬 on 2019/11/7.
//  Copyright © 2019 任敬. All rights reserved.
//

import UIKit

public extension URL {
    
    static func initPercent(_ string:String) -> URL? {
        let unEncodeStr = string.removingPercentEncoding
        let percentStr : String?
        if unEncodeStr != nil {
            percentStr = unEncodeStr!.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        }else{
            percentStr = string.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        }
        let url = URL.init(string: percentStr ?? "")
        return url
    }
    
    static func initImage(string : String , size : CGSize) -> URL? {
        let imageStr = string + "?imageView2/0/w/\(Int(size.width))/h/\(Int(size.width))"
        let percentStr = imageStr.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL.init(string: percentStr ?? "")
        return url
    }
    
}
