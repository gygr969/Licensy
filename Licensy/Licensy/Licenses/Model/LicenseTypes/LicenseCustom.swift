//
//  LicenseCustom.swift
//  Licensy
//
//  Created by Guillermo Garcia Rebolo on 22/2/17.
//  Copyright © 2017 RetoLabs. All rights reserved.
//

import UIKit

/// Describes a custom license designated by the user.
public class LicenseCustom: NSObject, License {
    
    fileprivate var company: String = ""
    fileprivate var copyright: String = ""

    fileprivate var privateName: String = ""
    
    /// The name of the license
    public var name: String {
        get {
            return self.privateName
        }
        set {
            self.privateName = newValue
        }
    }
    
    fileprivate var privateText: String = ""
    
    /// The license full text
    public var text: String {
        get {
            return self.privateText
        }
        set {
            self.privateText = newValue
        }
    }
    
    fileprivate var privateVersion: String = ""
    
    /// The license version
    public var version: String {
        get {
            return self.privateVersion
        }
        set {
            self.privateVersion = newValue
        }
    }
    
    fileprivate var privateURL: String = ""
    
    /// The license URL
    public var url: String {
        get {
            return self.privateURL
        }
        set {
            self.privateURL = newValue
        }
    }
    
    fileprivate override init() {
        
    }
    
    
    /// Initializer for a LicenseCustom object.
    ///
    /// - Parameters:
    ///   - name: The name of the license
    ///   - text: The license text
    ///   - version: The license version
    ///   - url: The license URL
    public init(name: String, text: String, version: String, url: String) {
        super.init()
        self.name = name
        self.text = text
        self.version = version
        self.url = url
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

/// Equatable conformance - defining equivalence for 'LicenseCustom'
///
/// - Parameters:
///   - lhs: first license
///   - rhs: seconde license
/// - Returns: if first license is equal to the second for property name
public func ==(lhs: LicenseCustom, rhs: LicenseCustom) -> Bool {
    return lhs.name == rhs.name
}
