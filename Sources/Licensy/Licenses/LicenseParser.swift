//
//  LicenseParser.swift
//  Licensy
//
//  Created by Guillermo Garcia Rebolo on 22/2/17.
//  Copyright © 2017 RetoLabs. All rights reserved.
//

import Foundation

internal class LicenseParser {
    
    internal class func getContent(_ filename: String, inBundle bundle: Bundle = CommonMethods.libraryBundle()) -> String? {
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
