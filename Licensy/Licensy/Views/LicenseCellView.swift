//
//  LicenseCellView.swift
//  Licensy
//
//  Created by David Jiménez Guinaldo on 22/2/17.
//  Copyright © 2017 RetoLabs. All rights reserved.
//

import UIKit

class LicenseCellView: UITableViewCell {

    @IBOutlet weak var licenseLabel: UILabel!
    
    open func configureCell(_ library: CellLibrary) {
        self.licenseLabel.text = !library.collapsedLicense ? library.license : ""
        self.collapseCell(library.collapsedLicense)
    }
    
    fileprivate func collapseCell(_ collapseLicense: Bool) {
        self.licenseLabel.isHidden = collapseLicense == true ? true : false
    }
    
}
