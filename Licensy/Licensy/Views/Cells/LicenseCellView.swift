//
//  LicenseCellView.swift
//  Licensy
//
//  Created by David Jiménez Guinaldo on 22/2/17.
//  Copyright © 2017 RetoLabs. All rights reserved.
//

import UIKit

internal class LicenseCellView: UITableViewCell {

    @IBOutlet weak var licenseLabel: UILabel!
    
    fileprivate var parentTable: LicensyTable!
    
    internal func configureCell(_ library: LibraryCell, parentTable: LicensyTable) {
        self.parentTable = parentTable
        
        let text = parentTable.appearance.licenseSize == .minimal ? library.licenseMinimal : library.licenseExtented
        
        self.licenseLabel.text = !library.licenseCollapsed ? text : ""
        //self.collapseCell(library.licenseCollapsed)
        applyAppearance()
    }
    
    func applyAppearance() {

        let appearance = parentTable.appearance
        
        self.contentView.backgroundColor = appearance.licenseContentBackgroundColor
        self.licenseLabel.textColor = appearance.licenseLabelColor
    }

    
    fileprivate func collapseCell(_ collapseLicense: Bool) {
        self.licenseLabel.isHidden = collapseLicense == true ? true : false
    }
    
}
