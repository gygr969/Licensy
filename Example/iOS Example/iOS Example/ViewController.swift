//
//  ViewController.swift
//  iOS Example
//
//  Created by Guillermo García Rebolo on 5/6/18.
//  Copyright © 2018 Guillermo García Rebolo. All rights reserved.
//

import UIKit
import Licensy

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: LicensyTable!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - Layout
    
    private func configureView() {
        self.configureLicensesAppearance()
        self.createCustomLicense()
        
        ////Option 1
        self.loadDataFromJSON()
        
        ////Option 2
        //        self.loadDataFrom(fileName: "librerias")
        
        ////Option 3
        //        self.loadDataFromArray()
    }
    
    //Customize one license
    private func createCustomLicense() {
        let customLicense: LicenseCustom = LicenseCustom(identifier: "MY_CUSTOM_LICENSE",
                                                         name: "Custom License",
                                                         text: "This is a custom license which you can use for edit your custom license that you have in your application.",
                                                         minimalText: "This is the minimal text",
                                                         version: "2017",
                                                         url: "url.com")
        
        self.tableView.organizer.registerLicense(customLicense)
    }
    
    private func loadDataFromJSON() {
        //Load tableView with a path for resource JSON
        guard let path: String = Bundle.main.path(forResource: "librerias", ofType: "json") else {
            return
        }
        self.tableView.setLibraries(forJsonResourcePath: path)
    }
    
    private func loadDataFrom(fileName: String) {
        //Load tableView with the name of the resource JSON
        self.tableView.setLibraries(forJsonResourceName: "librerias")
    }
    
    private func loadDataFromArray() {
        //Load tableView with an array on Library
        let librariesArray: [LibraryEntity] = [
            LibraryEntity(name: "Library 1", organization: "RetoLabs", url: "info@github.com", copyright: "Guillermo Garcia Rebolo", license: MITLicense()),
            LibraryEntity(name: "Library 2", organization: "RetoLabs", url: "info@github.com", copyright: "David Jiménez Guinaldo", license: ApacheSoftwareLicense20()),
            LibraryEntity(name: "Library 3", organization: "RetoLabs", url: "info@github.com", copyright: "Guillermo Garcia Rebolo", license: GnuGeneralPublicLicense30()),
            LibraryEntity(name: "Library 4", organization: "RetoLabs", url: "info@github.com", copyright: "David Jiménez Guinaldo", license: GnuGeneralPublicLicense30())
        ]
        self.tableView.setLibraries(librariesArray)
    }
    
    //Appearance
    
    private func configureLicensesAppearance() {
        self.tableView.appearance.roundLicenseButton = false
        
        //Change table view appearance with predefined style
        self.tableView.appearance.setOrangeFitAppearance()
        
        //Change table view appearance with custom values
        //        self.tableView.appearance.headerContentColor = UIColor.yellow
        //        self.tableView.appearance.headerBackgroundColor = UIColor.purple
        //        self.tableView.appearance.accentColor = UIColor.orange
    }
}

