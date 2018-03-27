//
//  LicenseParser.swift
//  Licensy
//
//  Created by Guillermo Garcia Rebolo on 22/2/17.
//  Copyright © 2017 RetoLabs. All rights reserved.
//

import UIKit

internal class LicenseParser {
    
    fileprivate class var bundle: Bundle {
        let podBundle = Bundle(for: LibraryEntity.self)
        let bundleURL = podBundle.url(forResource: "Licensy", withExtension: "bundle")
        return Bundle(url: bundleURL!)!
    }
    
    internal class func getContent(_ filename: String, inBundle bundle: Bundle = bundle) -> String? {
        guard let path: String = bundle.path(forResource: filename, ofType: "txt") else {
            return nil
        }
        guard let text: String = self.getText(from: path) else {
            return nil
        }
        return text.replacingOccurrences(of: "\\n", with: "\n")
    }
    
    //MARK: - Private method
    
    private class func getText(from path: String) -> String? {
        do {
            let value: String = try String(contentsOfFile: path, encoding: .utf8)
            return value
        }
        catch {
            return nil
        }
    }

}
