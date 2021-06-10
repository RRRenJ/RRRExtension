//
//  CustomString.swift
//  RRRExtensionDemo
//
//  Created by 任敬 on 2019/8/27.
//  Copyright © 2019 任敬. All rights reserved.
//

import UIKit
import CommonCrypto

public extension String {

    var length: Int {
        return self.count
    }
    
    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }
    
    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }
    
    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }
    
    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)), upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}
//size
public extension String {
    
    func boundingRect(with constrainedSize: CGSize, font: UIFont, lineSpacing: CGFloat? = nil, lines: Int) -> CGSize {
        
        if lines < 0 {
            return .zero
        }

        let size = boundingRect(with: constrainedSize, font: font, lineSpacing: lineSpacing)
        if lines == 0 {
            return size
        }
        
        let currentLineSpacing = (lineSpacing == nil) ? (font.lineHeight - font.pointSize) : lineSpacing!
        let maximumHeight = font.lineHeight*CGFloat(lines) + currentLineSpacing*CGFloat(lines - 1)
        if size.height >= maximumHeight {
            return CGSize(width: size.width, height: maximumHeight)
        }
        
        return size
    }
    
     func boundingRect(with constrainedSize: CGSize, font: UIFont, lineSpacing: CGFloat? = nil) -> CGSize {
        let attritube = NSMutableAttributedString(string: self)
        let range = NSRange(location: 0, length: attritube.length)
        attritube.addAttributes([NSAttributedString.Key.font: font], range: range)
        if lineSpacing != nil {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = lineSpacing!
            attritube.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: range)
        }
        
        let rect = attritube.boundingRect(with: constrainedSize, options: [.usesLineFragmentOrigin, .usesFontLeading], context: nil)
        var size = rect.size
        
        if let currentLineSpacing = lineSpacing {
            // 文本的高度减去字体高度小于等于行间距，判断为当前只有1行
            let spacing = size.height - font.lineHeight
            if spacing <= currentLineSpacing && spacing > 0 {
                size = CGSize(width: size.width, height: font.lineHeight)
            }
        }
        return size
    }
}
//validate
public extension String {
    
    func validate(regex:String) -> Bool {
        let pre = NSPredicate(format: "SELF MATCHES %@", regex)
        return pre.evaluate(with: self)
    }
    
    func validataEmail() -> Bool {
        let emailRegex = "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        return self.validate(regex: emailRegex)
    }
    
    func validataPhoneNumber() -> Bool {
        let phoneRegex = "^1\\d{10}$"
        return self.validate(regex: phoneRegex)
    }
    
    func validataPassword() -> Bool {
        let passwordRegex = "^[0-9a-zA-Z~@#$%^&*()]{6,16}$"
        return self.validate(regex: passwordRegex)
    }
    
    func validataMoney() -> Bool {
        let moneyRegex = "^[0-9]+(.[0-9]{1,2})?$"
        return self.validate(regex: moneyRegex)
    }
    
    func validateTextFieldMoney() -> Bool {
        let moneyRegex = "(\\+|\\-)?(([0]|(0[.]\\d{0,2}))|([1-9]\\d{0,9}(([.]\\d{0,2})?)))?"
        return self.validate(regex: moneyRegex)
    }
    
}
//html
public extension String {

    func clearHtml(marks:[String]?,comple :@escaping (String) -> Void) {
        
        DispatchQueue.global().async {
            var content = self
            let scanner = Scanner.init(string: self)
            var str : NSString?
            while scanner.isAtEnd == false {
                scanner.scanUpTo("<", into: nil)
                scanner.scanUpTo(">", into: &str)
                content = content.replacingOccurrences(of: "\(str == nil ? "" : str!)>", with: "")
                content = content.replacingOccurrences(of: "\r", with: "")
                content = content.replacingOccurrences(of: "\n", with: "")
                content = content.replacingOccurrences(of: "&nbsp;", with: "")
                if let _ = marks{
                    for mark in marks! {
                        content = content.replacingOccurrences(of: mark, with: "")
                    }
                }
            }
            DispatchQueue.main.async {
                comple(content)
            }
        }
    }
    
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
 
}

//encryption
public extension String {
    var md5: String{
        let ccharArray = self.cString(using: String.Encoding.utf8)
        
        var uint8Array = [UInt8](repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))
            
        CC_MD5(ccharArray, CC_LONG(ccharArray!.count - 1), &uint8Array)
            
        return uint8Array.reduce("") { $0 + String(format: "%02X", $1)}
    }
}

