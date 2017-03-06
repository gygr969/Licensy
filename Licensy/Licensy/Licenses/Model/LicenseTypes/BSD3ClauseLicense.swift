//
//  BSD3ClauseLicense.swift
//  Licensy
//
//  Created by Guillermo Garcia Rebolo on 22/2/17.
//  Copyright © 2017 RetoLabs. All rights reserved.
//

import UIKit

/// BSD 3-Clause License
public class BSD3ClauseLicense: NSObject, License {
    
    fileprivate var company: String = ""
    fileprivate var copyright: String = ""
    
    /// The identifier of the license
    public var identifier: String {
        get {
            return "BSD3"
        }
    }
    
    /// The name of the license
    public var name: String {
        get {
            return "BSD 3-Clause License"
        }
    }
    
    /// The license text
    public var text: String {
        get {
            return String.init(format: LicenseParser.getContent("bsd3"), company)
        }
    }
    
    /// The minimal license text
    public var minimalText: String {
        get {
            return String.init(format: LicenseParser.getContent("bsd3_minimal"), company)
        }
    }
    
    /// The license version
    public var version: String {
        get {
            return ""
        }
    }
    
    /// The license URL
    public var url: String {
        get {
            return "http://opensource.org/licenses/BSD-3-Clause"
        }
    }
    
    /// Configure the company and the copyright of the library for the license
    ///
    /// - Parameters:
    ///   - company: the company of the library
    ///   - copyright: the copyright of the library
    public func formatLicenseTextWithCompany(_ company: String, andCopyRight copyright: String) {
        self.company = company
        self.copyright = copyright
    }

}
