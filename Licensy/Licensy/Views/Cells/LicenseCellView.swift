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
    
    internal func configureCell(_ library: LibraryCell) {
        self.licenseLabel.text = !library.licenseCollapsed ? library.license : ""
        self.collapseCell(library.licenseCollapsed)
    }
    
    fileprivate func collapseCell(_ collapseLicense: Bool) {
        self.licenseLabel.isHidden = collapseLicense == true ? true : false
    }
    
}
