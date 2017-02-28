//
//  LibrariesTable.swift
//  Licensy
//
//  Created by David Jiménez Guinaldo on 22/2/17.
//  Copyright © 2017 RetoLabs. All rights reserved.
//

import UIKit

/// The table view for construct the list of 3rd Party Libraries
public class LibrariesTable: UITableView {

    fileprivate var kHeaderCellHeight: CGFloat = 44.0
    fileprivate var kCellHeight: CGFloat = 125.0
    
    fileprivate var cellsLibraries: Array<CellLibrary> = []
    fileprivate var libraries: Array<LibraryEntity> = []
    
    fileprivate class var bundle: Bundle {
        let podBundle =  Bundle(for: LibraryEntity.self)
        let bundleURL = podBundle.url(forResource: "Licensy", withExtension: "bundle")
        return Bundle(url: bundleURL!)!
    }
    
    /// The appearance of the table view
    public var appearance = Appearance()
    
    //MARK: - Init Methods
    
    /// Set libraries from a JSON file.
    ///
    /// - Parameter resourceName: The resource name of the JSON with the 3rd Party Libraries
    public func setLibraries(forJsonResourceName resourceName: String) {
        let path = LibrariesTable.bundle.path(forResource: resourceName, ofType: "json")!
        self.setLibraries(forJsonResourcePath: path)
    }
    
    /// Set libraries from a JSON file.
    ///
    /// - Parameter resourcePath: The file path to the JSON file containing the libraries.
    public func setLibraries(forJsonResourcePath resourcePath: String) {
        self.libraries = LibrariesPaser().setNoticesFromJSONFile(filepath: resourcePath)
        self.configureView()
    }
    
    /// Set libraries from a Libraries Entity Array.
    ///
    /// - Parameter libraries: The array containing the libraries.
    public func setLibraries(_ libraries: Array<LibraryEntity>) {
        self.libraries = libraries
        self.configureView()
    }
    
    //MARK: - Layout
    
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
        self.separatorStyle = .none
        self.allowsSelection = false
        
        self.register(UINib(nibName: "HeaderView", bundle: LibrariesTable.bundle), forHeaderFooterViewReuseIdentifier: "HeaderView")
        self.register(UINib(nibName: "CellView", bundle: LibrariesTable.bundle), forCellReuseIdentifier: "cell")
        self.register(UINib(nibName: "LicenseCellView", bundle: LibrariesTable.bundle), forCellReuseIdentifier: "licenseCell")
    }
}

//MARK: - UITableView Methods

extension LibrariesTable: UITableViewDataSource, UITableViewDelegate {
    
    /// The number of sections in table
    ///
    /// - Parameter tableView: the given tableview
    /// - Returns: the number of sections in the datasource
    public func numberOfSections(in tableView: UITableView) -> Int {
        return cellsLibraries.count
    }
    
    
    /// The number of row in a given section of the table view
    ///
    /// - Parameters:
    ///   - tableView: the table view
    ///   - section: the given section
    /// - Returns: the number of rows in the given section
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    
    /// The height for the header section view
    ///
    /// - Parameters:
    ///   - tableView: the table view
    ///   - section: the given section
    /// - Returns: the height of the header section view
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return kHeaderCellHeight
    }
    
    
    /// The height for a row in a given index path
    ///
    /// - Parameters:
    ///   - tableView: the table view
    ///   - indexPath: the given index path
    /// - Returns: the cell height
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return cellsLibraries[indexPath.section].collapsed! ? 0.0 : kCellHeight
        case 1:
            return cellsLibraries[indexPath.section].collapsedLicense! || cellsLibraries[indexPath.section].collapsed! ? 0.0 : UITableViewAutomaticDimension
        default:
            return 0.0
        }
    }
    
    
    /// The estimated cell height for the table view at a given index path
    ///
    /// - Parameters:
    ///   - tableView: the table view
    ///   - indexPath: the given index path
    /// - Returns: the estimated height for the row
    public func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    
    /// The view for a given section
    ///
    /// - Parameters:
    ///   - tableView: the table view
    ///   - section: the given section
    /// - Returns: returns the custom view for a given section
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderView") as! HeaderView
        
        header.configureHeader(cellsLibraries[section].name, section: section, parentTable: self, delegate: self)
        header.setCollapsed(cellsLibraries[section].collapsed)
        
        return header
    }
    
    
    /// Method for construct the cell for a given index path
    ///
    /// - Parameters:
    ///   - tableView: the table view
    ///   - indexPath: the given index path
    /// - Returns: returns the custom cell for a given index path
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CellView
            cell.configureCell(cellsLibraries[indexPath.section], section: indexPath.section,parentTable: self, delegate: self)
            
            return cell
        }
        else {
            let licenseCell = tableView.dequeueReusableCell(withIdentifier: "licenseCell", for: indexPath) as! LicenseCellView
            licenseCell.configureCell(cellsLibraries[indexPath.section])
            return licenseCell
        }
    }
}

//MARK: - HeaderViewDelegate

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

//MARK: - CellViewDelegate

extension LibrariesTable: CellViewDelegate {
    
    internal func toggleLicense(license: CellView, section: Int) {
        let collapsed = !cellsLibraries[section].collapsedLicense
        
        cellsLibraries[section].collapsedLicense = collapsed
        
        self.beginUpdates()
        self.reloadRows(at: [IndexPath(row: 1, section: section)], with: collapsed ? .top : .bottom)
        self.endUpdates()
    }
}

