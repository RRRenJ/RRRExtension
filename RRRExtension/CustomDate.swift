//
//  CustomDate.swift
//  RRRExtensionDemo
//
//  Created by 任敬 on 2019/8/29.
//  Copyright © 2019 任敬. All rights reserved.
//

import UIKit



public extension Date {

    enum Formate {
        case yMdHms
        case yMd
        case Hms
        case Md
        case Hm
    }
    /// string -> date
    ///
    /// - Parameters:
    ///   - string: string
    ///   - format: Formate
    /// - Returns: date
    static func dateFromString(string:String, _ format:Formate?) -> Date? {
        let dateFormat = DateFormatter.init()
        if let _ = format {
            var formatStr :String!
            switch format! {
            case .yMdHms:
                formatStr = "yyyy-MM-dd HH:mm:ss"
            case .yMd:
                formatStr = "yyyy-MM-dd"
            case .Hms:
                formatStr = "HH:mm:ss"
            case .Md:
                formatStr = "MM-dd"
            case .Hm:
                formatStr = "HH:mm"
            }
            dateFormat.dateFormat = formatStr
        }else{
            dateFormat.dateFormat = "yyyy-MM-dd HH:mm:ss"
        }
        return dateFormat.date(from: string)
    }

    /// date -> string
    ///
    /// - Parameter format: Formate
    /// - Returns: string
    func stringFromDate(_ format:Formate?) -> String {
        let dateFormat = DateFormatter.init()
        if let _ = format {
            var formatStr :String!
            switch format! {
            case .yMdHms:
                formatStr = "yyyy-MM-dd HH:mm:ss"
            case .yMd:
                formatStr = "yyyy-MM-dd"
            case .Hms:
                formatStr = "HH:mm:ss"
            case .Md:
                formatStr = "MM-dd"
            case .Hm:
                formatStr = "HH:mm"
            }
            dateFormat.dateFormat = formatStr
        }else{
            dateFormat.dateFormat = "yyyy-MM-dd HH:mm:ss"
        }
        return dateFormat.string(from: self)
    }
    
    //24小时制HHmm转12小时制
    func HHmmTohhmm() -> String {
        var hour = 0
        var min = 0
        if self.hour() >= 12 {
            hour = self.hour() - 12
            min = self.minute()
            if hour == 0 {
                return "12:\(min) am"
            }else{
                return "\(hour):\(min) pm"
            }
        }else{
            hour = self.hour()
            min = self.minute()
            if hour == 0 {
                return "12:\(min) pm"
            }else{
                return "\(hour):\(min) am"
            }
        }
    }
    
    /// 后面的时间和前面的时间相比  为正
    ///
    /// - Parameter time: 比较的时间
    /// - Returns:
    func compareWithTime(_ date : Date) -> Int {
        let time = self.timeIntervalSince(date)
        return Int(time)
    }
    /**
     获取时间戳 毫秒级
     */
    func timestamp() -> Int64 {
       let  time = self.timeIntervalSince1970 * 1000
        return Int64(time)
    }
    
    /// 根据时间戳获取时间 毫秒级
    ///
    /// - Parameter tims: 毫秒级时间戳
    /// - Returns: 时间
    static func dateFromTimestamp(tims:Int64) -> Date {
        let interval = tims / 1000
        
        return Date.init(timeIntervalSince1970: TimeInterval(interval))
    }
    
    
    
    

}

public extension Date {
    
    func year() -> Int {
        return Calendar.current.component(Calendar.Component.year, from: self)
    }
    
    func month() -> Int {
        return Calendar.current.component(Calendar.Component.month, from: self)
    }
    
    func day() -> Int {
        return Calendar.current.component(Calendar.Component.day, from: self)
    }
    func hour() -> Int {
        return Calendar.current.component(.hour, from: self)
    }
    func minute() -> Int {
        return Calendar.current.component(.minute, from: self)
    }
    func second() -> Int {
        return Calendar.current.component(.second, from: self)
    }
    ///1为周末
    func weekDay() -> Int {
        return Calendar.current.component(Calendar.Component.weekday, from: self)
    }
    /// 今年第几周
    ///
    /// - Returns: Int
    func weekOfYear() -> Int {
        return Calendar.current.component(Calendar.Component.weekOfYear, from: self)
    }
    /// 本月第几周
    ///
    /// - Returns: Int
    func weekOfMonth() -> Int {
        return Calendar.current.component(Calendar.Component.weekOfMonth, from: self)
    }
    /// 当月有几天
    ///
    /// - Returns: Int
    func daysOfMonth() -> Int {
        return Calendar(identifier: Calendar.Identifier.gregorian).range(of: Calendar.Component.day, in: Calendar.Component.month, for: self)?.count ?? 0
    }
    
    func isToday() -> Bool {
        if fabs(self.timeIntervalSinceNow) >= 3600 * 24 {
            return false
        }else{
            return Date().day() == self.day()
        }
    }
}

public extension Date {
    static func weekDay(_ week : Int) -> String? {
        if week == 1 {
            return "日"
        }else if week == 2 {
            return "一"
        }else if week == 3 {
            return "二"
        }else if week == 4 {
            return "三"
        }else if week == 5 {
            return "四"
        }else if week == 6 {
            return "五"
        }else if week == 7 {
            return "六"
        }else{
            return nil
        }
    }
}
