//
//  Appearance.swift
//  Licensy
//
//  Created by David Jiménez Guinaldo on 23/2/17.
//  Copyright © 2017 RetoLabs. All rights reserved.
//

import UIKit

/// The appearance of the table view
public class Appearance: NSObject {
    
    /// The color of the content of the headers
    public var headerContentColor: UIColor!
    
    /// The color of the background of the headers
    public var headerBackgroundColor: UIColor!
    
    /// The color of the links and icons
    public var accentColor: UIColor!
    
    /// Button libraries with rounded corners
    public var roundLicenseButton: Bool!
    
    /// Accesory image type
    public var accesory: AccesoryType = .arrow
    
    /// Licenses text size
    public var licenseSize: LicenseSize = .minimal

    override init() {
        super.init()
        self.setDefaultAppearance()
    }
    
    fileprivate func setDefaultAppearance() {
        self.headerContentColor = UIColor.white
        self.headerBackgroundColor = UIColor(red:0.15, green:0.30, blue:0.38, alpha:1.0)
        self.accentColor = UIColor(red:0.00, green:0.50, blue:0.50, alpha:1.0)
        self.roundLicenseButton = true;
        self.accesory = .arrow
    }

    /// Set an iOS style default colors based configuration appearance for the table
    public func setIOSDefaultAppearance() {
        self.headerContentColor = UIColor.gray
        self.headerBackgroundColor = UIColor(red:0.97, green:0.97, blue:0.97, alpha:1.0)
        self.accentColor = UIColor(red:0.00, green:0.48, blue:1.00, alpha:1.0)
        self.roundLicenseButton = false;
        self.accesory = .arrow
    }
    
    /// Set a light blue configuration appearance for the table
    public func setLightBlueAppearance() {
        self.headerContentColor = UIColor.white
        self.headerBackgroundColor = UIColor(red:0.11, green:0.73, blue:0.84, alpha:1.0)
        self.accentColor = UIColor(red:0.11, green:0.67, blue:0.80, alpha:1.0)
        self.roundLicenseButton = false;
        self.accesory = .arrow
    }
}

public extension Appearance {
    
    public enum AccesoryType {
        case arrow
        case plus
    }
    
    public enum LicenseSize {
        case minimal
        case extended
    }
    
}
