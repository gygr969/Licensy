//
//  LicenseOrganizer.swift
//  Licensy
//
//  Created by Guillermo Garcia Rebolo on 22/2/17.
//  Copyright © 2017 RetoLabs. All rights reserved.
//

import UIKit

/// Organizes the licenses of the framework and let and some more custom
public class LicenseOrganizer: NSObject {
    
    /// The shared instance of the license organizer
    public static let sharedInstance = LicenseOrganizer()
    
    internal var licenses: [String : License] = [:]
    
    internal func registerCommonLicenses() {
        self.licenses = [:]
        self.registerLicense(ApacheSoftwareLicense20())
        self.registerLicense(BSD3ClauseLicense())
        self.registerLicense(ISCLicense())
        self.registerLicense(MITLicense())
        self.registerLicense(GnuLesserGeneralPublicLicense21())
        self.registerLicense(CreativeCommonsAttributionNoDerivs30Unported())
        self.registerLicense(GnuGeneralPublicLicense30())
        self.registerLicense(GnuGeneralPublicLicense20())
        self.registerLicense(MozillaPublicLincese20())
    }
    
    /// Register a new license in the framework
    ///
    /// - Parameter license: The new license
    public func registerLicense(_ license: License) {
        self.licenses.updateValue(license, forKey: license.identifier)
    }
    
    override init() {
        super.init()
        self.registerCommonLicenses()
    }
    
    internal func licenseForIndetifier(_ identifier: String) -> License? {
        return self.licenses[identifier]
    }
    

}
