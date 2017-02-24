//
//  ViewController.swift
//  Licensy
//
//  Created by Guillermo Garcia Rebolo on 22/2/17.
//  Copyright © 2017 RetoLabs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: LibrariesTable!
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.appearance.headerContentColor = UIColor.yellow
//        tableView.appearance.headerBackgroundColor = UIColor.purple
//        tableView.appearance.accentColor = UIColor.orange
        tableView.appearance.setBlueGreenAppearance()
//        tableView.appearance.setLightBlueAppearance()
//        tableView.setLibraries(forJsonResourceName: "librerias")
        
        let path = Bundle.main.path(forResource: "librerias", ofType: "json")!
        tableView.setLibraries(forJsonResourcePath: path)
        tableView.appearance.roundLicenseButton = false
//        tableView.configureView()

    }
}

