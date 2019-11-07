//
//  CustomFileManager.swift
//  RRRExtensionDemo
//
//  Created by 任敬 on 2019/8/29.
//  Copyright © 2019 任敬. All rights reserved.
//

import UIKit


public extension FileManager {

    
    /// 检测指定全路径的文件是否存在
    ///
    /// - Parameter path: 文件的全路径
    /// - Returns: 存在还回true,否则返回false
    static func fileExist(path:String) -> Bool {
        return FileManager.default.fileExists(atPath: path)
    }
    
    /// 检测指定全路径的目录是否存在
    ///
    /// - Parameter path: 目录的全路径
    /// - Returns: 存在还回true,否则返回false
    static func dirExist(path:String) -> Bool {
        var isDir = ObjCBool.init(false)
        if !FileManager.default.fileExists(atPath: path, isDirectory: &isDir) || !isDir.boolValue {
            return false
        }
        return isDir.boolValue
    }
    
    /// 创建目录
    ///
    /// - Parameter path: 指定目录路径
    /// - Returns: 成功返回true
    static func mkDir(path:String) -> Bool {
        if !FileManager.dirExist(path: path) {
            
            do {
                 try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
                
                    return true
            }catch {
                print(error)
                return false
            }
            
        }else{
            return false
        }
    }
    
    /// 剪切
    ///
    /// - Parameters:
    ///   - from: 移动源路径
    ///   - to: 移动目标路径
    /// - Returns: 成功返回true
    static func cut(from:String, to:String) -> Bool {
        do {
            try  FileManager.default.moveItem(at: URL(fileURLWithPath: from), to: URL(fileURLWithPath: to))
            return true
        }catch {
            print(error)
            return false
        }
    }
    
    /// 拷贝
    ///
    /// - Parameters:
    ///   - from: 源路径
    ///   - to: 目标路径
    /// - Returns: 成功返回true
    static func copy(from:String, to:String) -> Bool {
        do {
            try  FileManager.default.copyItem(at: URL(fileURLWithPath: from), to: URL(fileURLWithPath: to))
            return true
        }catch {
            print(error)
            return false
        }
    }
    
    static func deleteFile(path:String) -> Bool {
        do {
            try  FileManager.default.removeItem(atPath: path)
            return true
        }catch {
            print(error)
            return false
        }
    }
    
    static func getFileSize(path : String) -> UInt64 {
        if !self.fileExist(path: path) {
            return 0
        }
        var size : UInt64 = 0
        
        do {
            let attr = try FileManager.default.attributesOfItem(atPath: path)
            size = attr[FileAttributeKey.size] as! UInt64
            let dict = attr as NSDictionary
            size = dict.fileSize()
            return size
        } catch {
            return 0
        }
    }
    
    
    static func getDirSize(path : String) -> UInt64 {
        if !self.dirExist(path: path) {
            return 0
        }
        let childFiles = FileManager.default.subpaths(atPath: path)
        
        var size : UInt64 = 0
        if let _ = childFiles {
            for childPath in childFiles! {
            let filePath = path + "/" + childPath
                size += self.getFileSize(path: filePath)
            }
            return size
        }else{
            return 0
        }
    }
    
    static func freeDiskSpaceInBytes() -> UInt64 {
        var buf = UnsafeMutablePointer<statfs>.allocate(capacity: MemoryLayout<statfs>.size).pointee
        if statfs("/var", &buf) >= 0 {
            return UInt64(UInt64(buf.f_bsize) * buf.f_bavail)
        }
        return 0
    }
    
    static func spaceSizeToString(fileSize:UInt64) -> String {
        let fileSize1 = CGFloat(fileSize)
        let KB:CGFloat = 1024
        let MB:CGFloat = KB*KB
        let GB:CGFloat = MB*KB
        
        if fileSize < 10
        {
            return "0 B"
            
        }else if fileSize1 < KB
        {
            return "< 1 KB"
        }else if fileSize1 < MB
        {
            return String(format: "%.2f KB", CGFloat(fileSize1)/KB)
        }else if fileSize1 < GB
        {
            return String(format: "%.2f MB", CGFloat(fileSize1)/MB)
        }else
        {
            return String(format: "%.2f GB", CGFloat(fileSize1)/GB)
        }
    }
    
    
}
