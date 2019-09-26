//
//  CustomNSObject.swift
//  RRRExtensionDemo
//
//  Created by 任敬 on 2019/9/26.
//  Copyright © 2019 任敬. All rights reserved.
//

import UIKit

extension NSObject {
    func getProperty(name: String) -> Any? {
        guard let _var = class_getInstanceVariable(type(of: self), name) else {
            return nil
        }

        return object_getIvar(self, _var)
    }
}
