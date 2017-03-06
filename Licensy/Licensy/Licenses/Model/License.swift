//
//  License.swift
//  Licensy
//
//  Created by Guillermo Garcia Rebolo on 22/2/17.
//  Copyright © 2017 RetoLabs. All rights reserved.
//

import UIKit

/// Describes a library's license
public protocol License: NSObjectProtocol {
    
    /// The identifier of the license
    var identifier: String {
        get
    }
    
    /// The name of the license
    var name: String {
        get
    }
    
    /// The license text
    var text: String {
        get
    }
    
    /// The minimal license text
    var minimalText: String {
        get
    }
    
    /// The license version
    var version: String {
        get
    }
    
    /// The license URL
    var url: String {
        get
    }
    
    
    /// Format the license text with a given company and copyright
    ///
    /// - Parameters:
    ///   - company: the name of the company of the library
    ///   - copyright: the copyright of the library
    func formatLicenseTextWithCompany(_ company: String, andCopyRight copyright: String)
    
}
