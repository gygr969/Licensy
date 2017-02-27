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

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        tableView.appearance.setBlueGreenAppearance()
        
        //Change table view appearance with custom values
        //        tableView.appearance.headerContentColor = UIColor.yellow
        //        tableView.appearance.headerBackgroundColor = UIColor.purple
        //        tableView.appearance.accentColor = UIColor.orange
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

