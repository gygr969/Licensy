//
//  LibraryEntity.swift
//  Licensy
//
//  Created by Guillermo Garcia Rebolo on 22/2/17.
//  Copyright © 2017 RetoLabs. All rights reserved.
//

/// The Library object is made up of the its name, url, copyright, and license.
public class LibraryEntity {
    
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
    
    /// The designated initializer for the LibraryEntity object
    ///
    /// - Parameters:
    ///   - model: The library model to map to entity
    public init(model: LibraryModel) {
        self.name = model.name
        self.organization = model.organization
        self.url = model.url
        self.copyright = model.copyright
        self.license = nil
        if let newLicense: License = LicenseOrganizer.sharedInstance.licenseForIndetifier(model.license) {
            newLicense.formatLicenseText(with: model.organization, copyright: model.copyright)
            self.license = newLicense
        }
    }
    
    /// The designated method for map LibraryModel into LibraryEntity object
    ///
    /// - Parameters:
    ///   - libraries: An array of library model for map to entity
    /// - Returns: An array of LibraryEntity objects
    public class func map(libraries: [LibraryModel]) -> [LibraryEntity] {
        var librariesEntity: [LibraryEntity] = []
        
        for library in libraries {
            librariesEntity.append(LibraryEntity(model: library))
        }
        
        return librariesEntity
    }
}
