//
//  GnuGeneralPublicLicense20.swift
//  Licensy
//
//  Created by Guillermo Garcia Rebolo on 22/2/17.
//  Copyright © 2017 RetoLabs. All rights reserved.
//

import UIKit

/// GNU General Public License 2.0
public class GnuGeneralPublicLicense20: NSObject, License {
    
    fileprivate var company: String = ""
    fileprivate var copyright: String = ""
    
    /// The identifier of the license
    public var identifier: String {
        get {
            return "GPL20"
        }
    }
    
    /// The name of the license
    public var name: String {
        get {
            return "GNU General Public License 2.0"
        }
    }
    
    /// The license text
    public var text: String {
        get {
            return String.init(format: LicenseParser.getContent("gpl_20"), copyright, copyright)
        }
    }
    
    /// The minimal license text
    public var minimalText: String {
        get {
            return LicenseParser.getContent("gpl_20_minimal")
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
            return "http://www.gnu.org/licenses/"
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
