//
//  LibraryEntity.swift
//  Licensy
//
//  Created by Guillermo Garcia Rebolo on 22/2/17.
//  Copyright © 2017 RetoLabs. All rights reserved.
//

import UIKit

/**
 *  The Library object is made up of the its name, url, copyright, and license.
 */
public class LibraryEntity: NSObject {
    
    /// The name of the library
    var name: String
    /// The name of the company / organization
    var organization: String
    /// The library url. Usually a github url
    var url: String
    /// The copyright (usually in format "Copyright (c) [YEAR] [NAME]")
    var copyright: String
    /// The license of the library.
    var license: License?
    
    /**
     The designated initializer for the LibraryEntity object
     
     - parameter name:      The name of the library
     - parameter url:       The library url
     - parameter copyright: The copyright info for the library.
     - parameter license:   The license of the library. Use a standard or custom license
     
     - returns: An instance of the Notice object
     */
    public init(name: String, organization: String, url: String, copyright: String, license: License) {
        self.name = name
        self.organization = organization
        self.url = url
        self.copyright = copyright
        self.license = license
        self.license?.formatLicenseTextWithCompany(organization, andCopyRight: copyright)
    }
}
