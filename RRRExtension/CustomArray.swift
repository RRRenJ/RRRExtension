//
//  CustomArray.swift
//  RRRExtensionDemo
//
//  Created by 任敬 on 2019/11/7.
//  Copyright © 2019 任敬. All rights reserved.
//

import UIKit

public extension Array where Element : Equatable  {

    mutating func delete(_ object : Element) {
        if let index = self.firstIndex(of: object) {
            self.remove(at: index)
        }
    }
    
}
