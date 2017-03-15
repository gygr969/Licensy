//
//  LicensyTable.swift
//  Licensy
//
//  Created by David Jiménez Guinaldo on 22/2/17.
//  Copyright © 2017 RetoLabs. All rights reserved.
//

import UIKit

/// The table view for construct the list of 3rd Party Libraries
public class LicensyTable: UITableView {

    fileprivate var kHeaderCellHeight: CGFloat = 44.0
    fileprivate var kCellHeight: CGFloat = 125.0
    fileprivate var openCells: Array<IndexPath> = []
    
    fileprivate var cellsLibraries: Array<LibraryCell> = []
    fileprivate var libraries: Array<LibraryEntity> = []
    
    fileprivate class var bundle: Bundle {
        let podBundle =  Bundle(for: LibraryEntity.self)
        let bundleURL = podBundle.url(forResource: "Licensy", withExtension: "bundle")
        return Bundle(url: bundleURL!)!
    }
    
    /// The appearance of the table view
    public var appearance = Appearance()
    
    /// The license organizer of the framework
    public private(set) var organizer = LicenseOrganizer.sharedInstance
    
    //MARK: - Init Methods
    
    /// Set libraries from a JSON file.
    ///
    /// - Parameter resourceName: The resource name of the JSON with the 3rd Party Libraries
    public func setLibraries(forJsonResourceName resourceName: String) {
        let path = Bundle.main.path(forResource: resourceName, ofType: "json")!
        self.setLibraries(forJsonResourcePath: path)
    }
    
    /// Set libraries from a JSON file.
    ///
    /// - Parameter resourcePath: The file path to the JSON file containing the libraries.
    public func setLibraries(forJsonResourcePath resourcePath: String) {
        self.libraries = LibrariesPaser().setLibrariesFromJSONFile(filepath: resourcePath)
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
            self.cellsLibraries.append(LibraryCell(name: library.name, url: library.url, copyright: library.copyright, organization: library.organization, license: library.license!))
        }
    }
    
    
    fileprivate func configureTableView() {
        self.delegate = self
        self.dataSource = self
        
        self.separatorColor = .clear
        self.separatorStyle = .none
        self.allowsSelection = false
        
        self.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        self.register(UINib(nibName: "HeaderView", bundle: LicensyTable.bundle), forHeaderFooterViewReuseIdentifier: "HeaderView")
        self.register(UINib(nibName: "InfoCellView", bundle: LicensyTable.bundle), forCellReuseIdentifier: "infoCell")
        self.register(UINib(nibName: "LicenseCellView", bundle: LicensyTable.bundle), forCellReuseIdentifier: "licenseCell")
    }
}

//MARK: - UITableView Methods

extension LicensyTable: UITableViewDataSource, UITableViewDelegate {
    
    /// The number of sections in table
    ///
    /// - Parameter tableView: the given tableview
    /// - Returns: the number of sections in the datasource
    public func numberOfSections(in tableView: UITableView) -> Int {
        return self.cellsLibraries.count
    }
    
    
    /// The number of row in a given section of the table view
    ///
    /// - Parameters:
    ///   - tableView: the table view
    ///   - section: the given section
    /// - Returns: the number of rows in the given section
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cellsLibraries[section].numRows
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
            return cellsLibraries[indexPath.section].infoCollapsed! ? 0.0 : kCellHeight
        case 1:
            return cellsLibraries[indexPath.section].licenseCollapsed! || cellsLibraries[indexPath.section].infoCollapsed! ? 0.0 : UITableViewAutomaticDimension
        default:
            return 0.0
        }
    }
    
    
    /// The footer view for a section
    ///
    /// - Parameters:
    ///   - tableView: the table view
    ///   - section: the given section
    /// - Returns: the view for the given section
    public func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    
    /// The estimated cell height for the table view at a given index path
    ///
    /// - Parameters:
    ///   - tableView: the table view
    ///   - indexPath: the given index path
    /// - Returns: the estimated height for the row
    public func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 128.0
    }
    
    
    /// The cell height for the table view at a given index path
    ///
    /// - Parameters:
    ///   - tableView: the table view
    ///   - indexPath: the given index path
    /// - Returns: the height for the row
    public func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
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
        header.setCollapsed(cellsLibraries[section].infoCollapsed)
        
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
            let infoCell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath) as! InfoCellView
            infoCell.configureCell(cellsLibraries[indexPath.section], section: indexPath.section,parentTable: self, delegate: self)
            return infoCell
        }
        else {
            let licenseCell = tableView.dequeueReusableCell(withIdentifier: "licenseCell", for: indexPath) as! LicenseCellView
            licenseCell.configureCell(cellsLibraries[indexPath.section], parentTable: self)
            return licenseCell
        }
    }
    
    
    internal func scrollToSection(_ section: Int) {
        var sectionRect = self.rect(forSection: section)
        sectionRect.size.height = self.frame.size.height
        self.scrollRectToVisible(sectionRect, animated: true)
    }
    
    internal func deleteOpenCells() {
        if self.openCells.count != 0 {
            for indexPath in self.openCells {
                self.cellsLibraries[indexPath.section].numRows = 0
                self.cellsLibraries[indexPath.section].infoCollapsed = true
                self.cellsLibraries[indexPath.section].licenseCollapsed = true
                
                if let header = self.headerView(forSection: indexPath.section) as? HeaderView {
                    header.setCollapsed(true)
                }
            }
            
            self.deleteRows(at: self.openCells, with: .fade)
            
            self.openCells.removeAll()
        }
    }
}

//MARK: - HeaderViewDelegate

extension LicensyTable: HeaderViewDelegate {
    
    internal func toggleSection(header: HeaderView, section: Int) {
        let isCollapsed = cellsLibraries[section].infoCollapsed as Bool
        
        cellsLibraries[section].infoCollapsed = !isCollapsed
        if isCollapsed {
            cellsLibraries[section].licenseCollapsed = isCollapsed
        }
        header.setCollapsed(!isCollapsed)
        
        CATransaction.begin()
        CATransaction.setCompletionBlock { () -> Void in
//            if isCollapsed {
//                self.scrollToSection(section)
//            }
            self.contentInset.top = 0
        }
        
        self.beginUpdates()
        if isCollapsed {
            self.deleteOpenCells()
            self.openCells.append(IndexPath(row: 0, section: section))
            self.cellsLibraries[section].numRows = 1
            self.insertRows(at:[IndexPath(row: 0, section: section)] , with: .fade)
        }
        else {
            self.deleteOpenCells()
        }

        self.endUpdates()
        
        CATransaction.commit()
    }
}

//MARK: - CellViewDelegate

extension LicensyTable: InfoCellViewDelegate {
    
    internal func toggleLicense(license: InfoCellView, section: Int) {
        let isCollapsed = cellsLibraries[section].licenseCollapsed as Bool
        
        cellsLibraries[section].licenseCollapsed = !isCollapsed
        
        CATransaction.begin()
        CATransaction.setCompletionBlock { () -> Void in
            if isCollapsed {
                self.scrollToSection(section)
            }
            self.contentInset.top = 0
        }
        
        self.beginUpdates()
        if isCollapsed {
            self.cellsLibraries[section].numRows = 2
            self.openCells.append(IndexPath(row: 1, section: section))
            self.insertRows(at:[IndexPath(row: 1, section: section)] , with: .fade)
        }
        else {
            self.cellsLibraries[section].numRows = 1
            self.openCells.removeLast()
            self.deleteRows(at:[IndexPath(row: 1, section: section)] , with: .fade)
        }
        self.endUpdates()
        
        CATransaction.commit()
    }
}

