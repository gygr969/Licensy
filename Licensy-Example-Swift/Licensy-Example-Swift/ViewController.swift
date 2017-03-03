//
//  ViewController.swift
//  Licensy-Example-Swift
//
//  Created by Guillermo Garcia Rebolo on 27/2/17.
//  Copyright © 2017 RetoLabs. All rights reserved.
//

import UIKit
import Licensy

class ViewController: UIViewController {

    @IBOutlet weak var tableView: LicensyTable!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Customize one license
        
        let customLicense = LicenseCustom(name: "Custom License",
                                          text: "This is a custom license which you can use for edit your custom license that you have in your application.",
                                          minimalText: "This is the minimal text",
                                          version: "2017",
                                          url: "url.com")
        
        self.tableView.organizer.registerLicense(customLicense)
        
        ////Option 1
        
        //Load tableView with a path for resource JSON
        let path = Bundle.main.path(forResource: "librerias", ofType: "json")!
        self.tableView.setLibraries(forJsonResourcePath: path)
        self.tableView.appearance.roundLicenseButton = false
        
        
        ////Option 2
        
        //Load tableView with the name of the resource JSON
        //        tableView.setLibraries(forJsonResourceName: "librerias")
        
        
        ////Option 3
        
        //Load tableView with an array on Library
        //        var librariesArray: Array<LibraryEntity> = [
        //            LibraryEntity(name: "Library 1", organization: "RetoLabs", url: "info@github.com", copyright: "Guillermo Garcia Rebolo", license: MITLicense()),
        //            LibraryEntity(name: "Library 2", organization: "RetoLabs", url: "info@github.com", copyright: "David Jiménez Guinaldo", license: ApacheSoftwareLicense20()),
        //            LibraryEntity(name: "Library 3", organization: "RetoLabs", url: "info@github.com", copyright: "Guillermo Garcia Rebolo", license: GnuGeneralPublicLicense30()),
        //            LibraryEntity(name: "Library 4", organization: "RetoLabs", url: "info@github.com", copyright: "David Jiménez Guinaldo", license: GnuGeneralPublicLicense30())
        //        ]
        //        tableView.setLibraries(librariesArray)
        
        
        ////Appearance
        
        //Change table view appearance with predefined style
        tableView.appearance.setOrangeFitAppearance()
        
        //Change table view appearance with custom values
        //        tableView.appearance.headerContentColor = UIColor.yellow
        //        tableView.appearance.headerBackgroundColor = UIColor.purple
        //        tableView.appearance.accentColor = UIColor.orange
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

