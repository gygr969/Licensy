//
//  LicenseParser.swift
//  Licensy
//
//  Created by Guillermo Garcia Rebolo on 22/2/17.
//  Copyright © 2017 RetoLabs. All rights reserved.
//

import UIKit

/**
 *  Parses license file from disk
 */
public class LicenseParser: NSObject {
    
    fileprivate class var bundle: Bundle {
        return Bundle(for: LibraryEntity.self)
    }
    
    /**
     Gets license string from a .txt file on disk.
     
     - parameter filename: The name of the .txt file containing license content, excluding extension
     - parameter bundle: The bundle that this file is in.
     
     - returns: The content of the .txt.
     */
    public class func getContent(_ filename: String, inBundle bundle: Bundle = bundle) -> String! {
        if let path = bundle.path(forResource: filename, ofType: "txt") {
            let string: NSString?
            do {
                string = try NSString(contentsOfFile: path, encoding: String.Encoding.utf8.rawValue)
                let stringValue = string as! String
                return stringValue.replacingOccurrences(of: "\\n", with: "\n")
            } catch {
                return nil
            }
        } else {
            return nil
        }
    }

}
