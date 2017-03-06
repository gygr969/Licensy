//
//  ApacheSoftwareLicense20.swift
//  Licensy
//
//  Created by Guillermo Garcia Rebolo on 22/2/17.
//  Copyright © 2017 RetoLabs. All rights reserved.
//

import UIKit

/// Apache Software License, Version 2.0
public class ApacheSoftwareLicense20: NSObject, License {
    
    fileprivate var company: String = ""
    fileprivate var copyright: String = ""
    
    /// The identifier of the license
    public var identifier: String {
        get {
            return "ASL_20"
        }
    }
    
    /// The name of the license
    public var name: String {
        get {
            return "Apache Software License 2.0"
        }
    }
    
    /// The license text
    public var text: String {
        get {
            return String.init(format: LicenseParser.getContent("asl_20"), copyright)
        }
    }
    
    /// The minimal license text
    public var minimalText: String {
        get {
            return LicenseParser.getContent("asl_20_minimal")
        }
    }
    
    /// The version text
    public var version: String {
        get {
            return "2.0"
        }
    }
    
    /// The license URL
    public var url: String {
        get {
            return "http://www.apache.org/licenses/LICENSE-2.0.txt"
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
