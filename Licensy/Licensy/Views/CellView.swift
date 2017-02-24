//
//  CellView.swift
//  Licensy
//
//  Created by David Jiménez Guinaldo on 22/2/17.
//  Copyright © 2017 RetoLabs. All rights reserved.
//

import UIKit

fileprivate var kUrlLabelTopMargin: CGFloat = 20.0
fileprivate var kCopyrightLabelTopMargin: CGFloat = 12.0
fileprivate var kLicenseButtonTopMargin: CGFloat = 12.5
fileprivate var kLicenseButtonBottomMargin: CGFloat = 16.0


internal protocol CellViewDelegate: NSObjectProtocol {
    func toggleLicense(license: CellView, section: Int)
}


class CellView: UITableViewCell {

    @IBOutlet weak var urlLabel: UILabel!
    @IBOutlet weak var copyrightLabel: UILabel!
    @IBOutlet weak var licenseButton: UIButton!
    
    @IBOutlet weak var urlLabelTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var copyrightLabelTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var licenseButtonTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var licenseButtonBottomConstraint: NSLayoutConstraint!
    
    fileprivate var parentTable: LibrariesTable!
    fileprivate var delegate: CellViewDelegate?
    fileprivate var section: Int = 0
    fileprivate var collapsedLicense: Bool!
    
    open func configureCell(_ library: CellLibrary, section: Int, parentTable: LibrariesTable, delegate: CellViewDelegate) {
        self.section = section
        self.parentTable = parentTable
        self.delegate = delegate
        self.urlLabel.text = library.url
        self.copyrightLabel.text = library.copyright
        self.collapseCell(library.collapsed)
        self.collapsedLicense = library.collapsedLicense
        applyAppearance()
        setLicenseButtonTitle()
    }
    
    func applyAppearance() {
        let appearance = parentTable.appearance
        
        urlLabel.textColor = appearance.accentColor
    
        licenseButton.setBackgroundColor(color: appearance.accentColor, forState: .normal)
        
        if appearance.roundLicenseButton == true {
            licenseButton.layer.cornerRadius = licenseButton.frame.height / 2
            licenseButton.clipsToBounds = true
        }
    }
    
    
    
    fileprivate func collapseCell(_ collapse: Bool) {
        self.urlLabel.isHidden = collapse == true ? true : false
        self.copyrightLabel.isHidden = collapse == true ? true : false
        self.licenseButton.isHidden = collapse == true ? true : false
        
        self.urlLabelTopConstraint.constant = collapse == true ? 0.0 : kUrlLabelTopMargin
        self.copyrightLabelTopConstraint.constant = collapse == true ? 0.0 : kCopyrightLabelTopMargin
        self.licenseButtonTopConstraint.constant = collapse == true ? 0.0 : kLicenseButtonTopMargin
        self.licenseButtonBottomConstraint.constant = collapse == true ? 0.0 : kLicenseButtonBottomMargin
    }
    
    @IBAction func collapseLicense(_ sender: UIButton) {
        collapsedLicense = !collapsedLicense
        setLicenseButtonTitle()
        disableLicenseButton()
        delegate?.toggleLicense(license: self, section: section)
    }
    
    fileprivate func setLicenseButtonTitle() {
        licenseButton.setTitle(!collapsedLicense ? "Ocultar licencia" : "Ver licencia", for: .normal)
    }
    
    fileprivate func disableLicenseButton() {
        licenseButton.isEnabled = false
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(300), execute: {
            self.licenseButton.isEnabled = true
        })
    }
    
}


