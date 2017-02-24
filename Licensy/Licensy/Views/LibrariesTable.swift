//
//  LibrariesTable.swift
//  Licensy
//
//  Created by David Jiménez Guinaldo on 22/2/17.
//  Copyright © 2017 RetoLabs. All rights reserved.
//

import UIKit

class LibrariesTable: UITableView, UITableViewDelegate, UITableViewDataSource {

    fileprivate var kHeaderCellHeight: CGFloat = 44.0
    fileprivate var kCellHeight: CGFloat = 125.0
    
    fileprivate var cellsLibraries: Array<CellLibrary> = []
    fileprivate var libraries: Array<LibraryEntity> = []
    
    fileprivate class var bundle: Bundle {
        return Bundle(for: LibraryEntity.self)
    }
    public var appearance = Appearance()
    
    public func setLibraries(forJsonResourceName resourceName: String) {
        let path = LibrariesTable.bundle.path(forResource: resourceName, ofType: "json")!
        setLibraries(forJsonResourcePath: path)
    }
    
    public func setLibraries(forJsonResourcePath resourcePath: String) {
        libraries = LibrariesPaser().setNoticesFromJSONFile(filepath: resourcePath)
        configureView()
    }
    
    fileprivate func configureView() {
        self.configureCellLibraries()
        self.configureTableView()
    }
    
    
    fileprivate func configureCellLibraries() {
        for library in self.libraries {
            self.cellsLibraries.append(CellLibrary(name: library.name, url: library.url, copyright: library.copyright, organization: library.organization, license: (library.license?.text)!))
        }
    }
    
    
    fileprivate func configureTableView() {
        self.delegate = self
        self.dataSource = self
        
        self.separatorColor = .clear
        self.allowsSelection = false
        
        self.register(UINib(nibName: "HeaderView", bundle: LibrariesTable.bundle), forHeaderFooterViewReuseIdentifier: "HeaderView")
        self.register(UINib(nibName: "CellView", bundle: LibrariesTable.bundle), forCellReuseIdentifier: "cell")
        self.register(UINib(nibName: "LicenseCellView", bundle: LibrariesTable.bundle), forCellReuseIdentifier: "licenseCell")
    }
    
    
    
    
    internal func numberOfSections(in tableView: UITableView) -> Int {
        return cellsLibraries.count
    }
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    internal func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return kHeaderCellHeight
    }
    
    internal func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return cellsLibraries[indexPath.section].collapsed! ? 0.0 : kCellHeight
        case 1:
            return cellsLibraries[indexPath.section].collapsedLicense! || cellsLibraries[indexPath.section].collapsed! ? 0.0 : UITableViewAutomaticDimension
        default:
            return 0.0
        }
    }
    
    internal func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    internal func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderView") as! HeaderView
        
        header.parentTable = self
        
        header.configureHeader(cellsLibraries[section].name, section: section, delegate: self)
        header.setCollapsed(cellsLibraries[section].collapsed)
        
        return header
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CellView
            cell.configureCell(cellsLibraries[indexPath.section], section: indexPath.section,parentTable: self, delegate: self)
            
            return cell
            
        } else {
            let licenseCell = tableView.dequeueReusableCell(withIdentifier: "licenseCell", for: indexPath) as! LicenseCellView
            licenseCell.configureCell(cellsLibraries[indexPath.section])
            return licenseCell
        }
    }
}


extension LibrariesTable: HeaderViewDelegate {
    
    internal func toggleSection(header: HeaderView, section: Int) {
        let collapsed = !cellsLibraries[section].collapsed
        
        cellsLibraries[section].collapsed = collapsed
        if collapsed {
            cellsLibraries[section].collapsedLicense = collapsed
        }
        header.setCollapsed(collapsed)
        
        
        self.beginUpdates()
        self.reloadRows(at: [IndexPath(row: 0, section: section)], with: collapsed ? .top : .bottom)
        self.reloadRows(at: [IndexPath(row: 1, section: section)], with: collapsed ? .top : .bottom)
        self.endUpdates()
    }
}

extension LibrariesTable: CellViewDelegate {
    
    internal func toggleLicense(license: CellView, section: Int) {
        let collapsed = !cellsLibraries[section].collapsedLicense
        
        cellsLibraries[section].collapsedLicense = collapsed
        
        self.beginUpdates()
        self.reloadRows(at: [IndexPath(row: 1, section: section)], with: collapsed ? .top : .bottom)
        self.endUpdates()
    }
}

