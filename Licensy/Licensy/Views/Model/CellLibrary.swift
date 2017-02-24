//
//  CellData.swift
//  Licensy
//
//  Created by David Jiménez Guinaldo on 22/2/17.
//  Copyright © 2017 RetoLabs. All rights reserved.
//

import Foundation

struct CellLibrary {
    var name: String!
    var url: String!
    var organization: String!
    var copyright: String!
    var license: String!
    var collapsed: Bool!
    var collapsedLicense: Bool!
    
    init(name: String, url: String, copyright: String, organization: String, license: String, collapsed: Bool = true, collapsedLicense: Bool = true) {
        self.name = name
        self.url = url
        self.organization = organization
        self.copyright = copyright
        self.license = license
        self.collapsed = collapsed
        self.collapsedLicense = collapsedLicense
    }
}
