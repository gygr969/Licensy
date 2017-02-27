//
//  LicenseParser.swift
//  Licensy
//
//  Created by Guillermo Garcia Rebolo on 22/2/17.
//  Copyright © 2017 RetoLabs. All rights reserved.
//

import UIKit

internal class LicenseParser: NSObject {
    
    fileprivate class var bundle: Bundle {
        let podBundle =  Bundle(for: LibraryEntity.self)
        let bundleURL = podBundle.url(forResource: "Licensy", withExtension: "bundle")
        return Bundle(url: bundleURL!)!
    }
    
    internal class func getContent(_ filename: String, inBundle bundle: Bundle = bundle) -> String! {
        if let path = bundle.path(forResource: filename, ofType: "txt") {
            let string: NSString?
            do {
                string = try NSString(contentsOfFile: path, encoding: String.Encoding.utf8.rawValue)
                let stringValue = string as! String
                return stringValue.replacingOccurrences(of: "\\n", with: "\n")
            }
            catch {
                return nil
            }
        }
        else {
            return nil
        }
    }

}
