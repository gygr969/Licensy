//
//  LicenseOrganizer.swift
//  Licensy
//
//  Created by Guillermo Garcia Rebolo on 22/2/17.
//  Copyright © 2017 RetoLabs. All rights reserved.
//

import UIKit

internal class LicenseOrganizer: NSObject {
    
    internal var licenses: [String : License] = [:]
    
    internal func registerCommonLicenses() {
        licenses = [:]
        registerLicense(ApacheSoftwareLicense20())
        registerLicense(BSD3ClauseLicense())
        registerLicense(ISCLicense())
        registerLicense(MITLicense())
        registerLicense(GnuLesserGeneralPublicLicense21())
        registerLicense(CreativeCommonsAttributionNoDerivs30Unported())
        registerLicense(GnuGeneralPublicLicense30())
        registerLicense(GnuGeneralPublicLicense20())
    }
    
    internal func registerLicense(_ license: License) {
        licenses.updateValue(license, forKey: license.name)
    }
    
    override init() {
        super.init()
        registerCommonLicenses()
    }
    
    internal func licenseForName(_ name: String) -> License? {
        return licenses[name]
    }
    

}
