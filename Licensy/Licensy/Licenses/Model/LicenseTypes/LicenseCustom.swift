//
//  LicenseCustom.swift
//  Licensy
//
//  Created by Guillermo Garcia Rebolo on 22/2/17.
//  Copyright © 2017 RetoLabs. All rights reserved.
//

/// Describes a custom license designated by the user.
public class LicenseCustom: License {
    
    fileprivate var company: String = ""
    fileprivate var copyright: String = ""
    fileprivate var privateText: String = ""
    fileprivate var privateMinimalText: String = ""
    
    /// The identifier of the license
    public var identifier: String = ""
    
    /// The name of the license
    public var name: String = ""
    
    
    /// The license text
    public var text: String {
        get {
            return String.init(format: "%@\n", self.privateText)
        }
        set {
            self.privateText = newValue
        }
    }
    
    /// The minimal license text
    public var minimalText: String {
        get {
            return String.init(format: "%@\n", self.minimalText)
        }
        set {
            self.privateMinimalText = newValue
        }
    }
    
    /// The license version
    public var version: String = ""
    
    /// The license URL
    public var url: String = ""
    
    /// Initializer for a LicenseCustom object.
    ///
    /// - Parameters:
    ///   - identifier: The identifier of the license
    ///   - name: The name of the license
    ///   - text: The license text
    ///   - minimalText: The minimal text of the license
    ///   - version: The license version
    ///   - url: The license URL
    public init(identifier: String, name: String, text: String, minimalText: String, version: String, url: String) {
        self.identifier = identifier
        self.name = name
        self.text = text
        self.minimalText = minimalText
        self.version = version
        self.url = url
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

/// Equatable conformance - defining equivalence for 'LicenseCustom'
///
/// - Parameters:
///   - lhs: first license
///   - rhs: seconde license
/// - Returns: if first license is equal to the second for property name
public func ==(lhs: LicenseCustom, rhs: LicenseCustom) -> Bool {
    return lhs.identifier == rhs.identifier
}
