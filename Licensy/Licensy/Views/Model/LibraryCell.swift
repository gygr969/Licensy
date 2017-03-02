//
//  LibraryCell.swift
//  Licensy
//
//  Created by David Jiménez Guinaldo on 22/2/17.
//  Copyright © 2017 RetoLabs. All rights reserved.
//

import Foundation

struct LibraryCell {
    var name: String!
    var url: String!
    var organization: String!
    var copyright: String!
    var licenseExtented: String!
    var licenseMinimal: String!
    var infoCollapsed: Bool!
    var licenseCollapsed: Bool!
    var numRows: Int! = 0
    
    init(name: String, url: String, copyright: String, organization: String, license: License, infoCollapsed: Bool = true, licenseCollapsed: Bool = true) {
        self.name = name
        self.url = url
        self.organization = organization
        self.copyright = copyright
        self.licenseExtented = license.text
        self.licenseMinimal = license.minimalText
        self.infoCollapsed = infoCollapsed
        self.licenseCollapsed = licenseCollapsed
    }
}
