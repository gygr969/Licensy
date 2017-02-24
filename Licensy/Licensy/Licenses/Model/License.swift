//
//  License.swift
//  Licensy
//
//  Created by Guillermo Garcia Rebolo on 22/2/17.
//  Copyright © 2017 RetoLabs. All rights reserved.
//

import UIKit
/**
 Describes a library's license
 */
public protocol License: NSObjectProtocol {
    
    /**
     The name of the license
     */
    var name: String {
        get
    }
    
    /**
     The license text
     */
    var text: String {
        get
    }
    
    /**
     The license version
     */
    var version: String {
        get
    }
    
    /**
     The license URL
     */
    var url: String {
        get
    }
    
    func formatLicenseTextWithCompany(_ company: String, andCopyRight copyright: String)
    
}
