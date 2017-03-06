//
//  MozillaPublicLincese20.swift
//  Licensy
//
//  Created by Guillermo Garcia Rebolo on 22/2/17.
//  Copyright © 2017 RetoLabs. All rights reserved.
//

import UIKit

/// Mozilla Public License, Version 2.0
public class MozillaPublicLincese20: NSObject, License {
    
    fileprivate var company: String = ""
    fileprivate var copyright: String = ""
    
    /// The identifier of the license
    public var identifier: String {
        get {
            return "MPL20"
        }
    }
    
    /// The name of the license
    public var name: String {
        get {
            return "Mozilla Public License, Version 2.0"
        }
    }
    
    /// The license text
    public var text: String {
        get {
            return LicenseParser.getContent("mpl_20")
        }
    }
    
    /// The minimal license text
    public var minimalText: String {
        get {
            return LicenseParser.getContent("mpl_minimal")
        }
    }
    
    /// The license version
    public var version: String {
        get {
            return "2.0"
        }
    }
    
    /// The license URL
    public var url: String {
        get {
            return "https://www.mozilla.org/MPL/2.0/"
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
