//
//  CustomTableView.swift
//  RRRExtensionDemo
//
//  Created by 任敬 on 2019/9/2.
//  Copyright © 2019 任敬. All rights reserved.
//

import UIKit

public extension UITableView {

    func footerViewEmpty(_ color:UIColor?) {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 34))
        view.backgroundColor = color
        self.tableFooterView = view
    }
    func footerViewEmptyAll() {
        self.tableFooterView = UIView()
    }

    
    func footerView(message:String, msgFrame:CGRect, _ image:String?, _ imgFrame:CGRect?) {
        let footerView : UIView!
        var footerHeight = msgFrame.maxY
        
        if let _ = imgFrame {
            footerHeight = max(msgFrame.maxY, imgFrame!.maxY)
        }
        footerView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: footerHeight))

        if let _ = image {
            let imageView = UIImageView(frame: imgFrame!)
            imageView.image = UIImage(named: image!)
            footerView.addSubview(imageView)
        }
        let msgLb = UILabel(title: message, color: UIColor.hex(hexCode: "999999"), font: UIFont.systemFont(ofSize: 14), NSTextAlignment.center, msgFrame)
        msgLb.numberOfLines = 0
        footerView.addSubview(msgLb)
        self.tableFooterView = footerView
    }
    
    func headerViewBackgoundColor(color:UIColor) {
        let bgView = UIView(frame: self.bounds.offsetBy(dx: 0, dy: -self.bounds.height))
        bgView.backgroundColor = color
        self.insertSubview(bgView, at: 0)
    }
    
    func headerViewBackgroundGradient(fromColor:UIColor, toColor:UIColor) {
        let bgView = UIView(frame: self.bounds.offsetBy(dx: 0, dy: -self.bounds.height))
        let layer = UIColor.gradientColor(view: bgView, fromColor: fromColor, toColor: toColor, fromPoint: CGPoint(x: 0, y: 0), toPoint:  CGPoint(x: 1, y: 0))
        bgView.layer.addSublayer(layer)
        self.insertSubview(bgView, at: 0)
    }
    
}
