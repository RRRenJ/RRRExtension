//
//  CustomCollectionView.swift
//  RRRExtensionDemo
//
//  Created by 任敬 on 2019/9/2.
//  Copyright © 2019 任敬. All rights reserved.
//

import UIKit

private var footerViewKey = "footerViewKey"

public extension UICollectionView {


    func footerViewEmpty() {
        if let _ = self.footerView{
            self.footerView!.removeFromSuperview()
        }
    }
    
    func footerView(viewY:CGFloat ,message:String, msgFrame:CGRect, _ image:String?, _ imgFrame:CGRect?) {
        var footerHeight = msgFrame.maxY
        if let _ = imgFrame {
            footerHeight = max(msgFrame.maxY, imgFrame!.maxY)
        }
        if let _ = self.footerView {
            self.footerView!.subviews.forEach { (subview) in
                subview.removeFromSuperview()
            }
            self.footerView!.frame = CGRect(x: 0, y: viewY, width: UIScreen.main.bounds.width, height: footerHeight)
        }else{
            self.footerView = UIView(frame: CGRect(x: 0, y: viewY, width: UIScreen.main.bounds.width, height: footerHeight))
        }

        if let _ = image {
            let imageView = UIImageView(frame: imgFrame!)
            imageView.image = UIImage(named: image!)
            self.footerView!.addSubview(imageView)
        }
        let msgLb = UILabel(title: message, color: UIColor.hex("999999"), font: UIFont.systemFont(ofSize: 14), NSTextAlignment.center, msgFrame)
        msgLb.numberOfLines = 0
        self.footerView!.addSubview(msgLb)
        self.addSubview(self.footerView!)
    }
    
    
    
    
    
    var footerView : UIView? {
        set {
            objc_setAssociatedObject(self, &footerViewKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            if let view = objc_getAssociatedObject(self, &footerViewKey) as? UIView {
                return view
            }else{
                return nil
            }
        }
    }
    
}

public extension UICollectionView {
    
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
