//
//  GnuGeneralPublicLicense30.swift
//  Licensy
//
//  Created by Guillermo Garcia Rebolo on 22/2/17.
//  Copyright © 2017 RetoLabs. All rights reserved.
//

/// GNU General Public License 3.0
public class GnuGeneralPublicLicense30: License {
    
    fileprivate var company: String = ""
    fileprivate var copyright: String = ""
    
    /// The initializer of the license
    public init() {
    }
    
    /// The identifier of the license
    public var identifier: String {
        get {
            return "GPL30"
        }
    }
    
    /// The name of the license
    public var name: String {
        get {
            return "GNU General Public License 3.0"
        }
    }
    
    /// The license text
    public var text: String {
        get {
            guard let value: String = LicenseParser.getContent("gpl_30") else {
                return ""
            }
            return String(format: value, copyright, copyright)
        }
    }
    
    /// The minimal license text
    public var minimalText: String {
        get {
            guard let value: String = LicenseParser.getContent("gpl_30_minimal") else {
                return ""
            }
            return value
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
            return "http://www.gnu.org/licenses/"
        }
    }
    
    /// Configure the company and the copyright of the library for the license
    ///
    /// - Parameters:
    ///   - company: the company of the library
    ///   - copyright: the copyright of the library
    public func formatLicenseText(with company: String, copyright: String) {
        self.company = company
        self.copyright = copyright
    }
    
}
