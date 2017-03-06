//
//  CreativeCommonsAttributionNoDerivs30Unported.swift
//  Licensy
//
//  Created by Guillermo Garcia Rebolo on 22/2/17.
//  Copyright © 2017 RetoLabs. All rights reserved.
//

import UIKit

/// Creative Commons Attribution-NoDerivs 3.0 Unported
public class CreativeCommonsAttributionNoDerivs30Unported: NSObject, License {
    
    fileprivate var company: String = ""
    fileprivate var copyright: String = ""
    
    /// The identifier of the license
    public var identifier: String {
        get {
            return "CCAND"
        }
    }
    
    /// The name of the license
    public var name: String {
        get {
            return "Creative Commons Attribution-NoDerivs 3.0 Unported"
        }
    }
    
    /// The license text
    public var text: String {
        get {
            return LicenseParser.getContent("ccand_30")
        }
    }
    
    /// The minimal license text
    public var minimalText: String {
        get {
            return LicenseParser.getContent("ccand_30_minimal")
        }
    }
    
    /// The license version
    public var version: String {
        get {
            return "3.0"
        }
    }
    
    /// The license URL
    public var url: String {
        get {
            return "http://creativecommons.org/licenses/by-nd/3.0"
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
