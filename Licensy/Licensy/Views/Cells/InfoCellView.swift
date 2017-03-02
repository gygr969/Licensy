//
//  InfoCellView.swift
//  Licensy
//
//  Created by David Jiménez Guinaldo on 22/2/17.
//  Copyright © 2017 RetoLabs. All rights reserved.
//

import UIKit

fileprivate var kDefaultButtonHeight: CGFloat = 25.0
fileprivate var kUrlLabelTopMargin: CGFloat = 13.0
fileprivate var kCopyrightLabelTopMargin: CGFloat = 12.0
fileprivate var kLicenseButtonTopMargin: CGFloat = 12.5
fileprivate var kLicenseButtonBottomMargin: CGFloat = 16.0


internal protocol InfoCellViewDelegate: NSObjectProtocol {
    func toggleLicense(license: InfoCellView, section: Int)
}


class InfoCellView: UITableViewCell {

    @IBOutlet weak var urlButton: UIButton!
    @IBOutlet weak var copyrightLabel: UILabel!
    @IBOutlet weak var licenseButton: UIButton!
    
    @IBOutlet weak var urlButtonHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var licenseButtonHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var urlButtonTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var copyrightUrlButtonTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var licenseButtonTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var licenseButtonBottomConstraint: NSLayoutConstraint!
    
    fileprivate var parentTable: LicensyTable!
    fileprivate var delegate: InfoCellViewDelegate?
    fileprivate var section: Int = 0
    fileprivate var licenseCollapsed: Bool!
    
    internal func configureCell(_ library: LibraryCell, section: Int, parentTable: LicensyTable, delegate: InfoCellViewDelegate) {
        self.section = section
        self.parentTable = parentTable
        self.delegate = delegate
        self.urlButton.setTitle(library.url, for: .normal)
        self.copyrightLabel.text = library.copyright
        //self.collapseCell(library.infoCollapsed)
        self.licenseCollapsed = library.licenseCollapsed
        applyAppearance()
        setLicenseButtonTitle()
    }
    
    func applyAppearance() {
        let appearance = parentTable.appearance
        
        urlButton.setTitleColor(appearance.accentColor, for: .normal)
    
        licenseButton.setBackgroundColor(color: appearance.accentColor, forState: .normal)
        licenseButton.setTitleColor(appearance.licenseContentBackgroundColor, for: .normal)
        
        self.contentView.backgroundColor = appearance.licenseContentBackgroundColor
        
        self.copyrightLabel.textColor = appearance.copyrightLabelColor
        
        if appearance.roundLicenseButton == true {
            licenseButton.layer.cornerRadius = 5
            licenseButton.clipsToBounds = true
        }
    }
    
    fileprivate func collapseCell(_ collapse: Bool) {
        self.urlButton.isHidden = collapse == true ? true : false
        self.copyrightLabel.isHidden = collapse == true ? true : false
        self.licenseButton.isHidden = collapse == true ? true : false
        
        self.urlButtonHeightConstraint.constant = collapse == true ? 0.0 : kDefaultButtonHeight
        self.licenseButtonHeightConstraint.constant = collapse == true ? 0.0 : kDefaultButtonHeight
        
        self.urlButtonTopConstraint.constant = collapse == true ? 0.0 : kUrlLabelTopMargin
        self.copyrightUrlButtonTopConstraint.constant = collapse == true ? 0.0 : kCopyrightLabelTopMargin
        self.licenseButtonTopConstraint.constant = collapse == true ? 0.0 : kLicenseButtonTopMargin
        self.licenseButtonBottomConstraint.constant = collapse == true ? 0.0 : kLicenseButtonBottomMargin
    }
    
    
    /// Method that triggers the collapse of the license cell
    ///
    /// - Parameter sender: UIButton
    @IBAction func collapseLicense(_ sender: UIButton) {
        licenseCollapsed = !licenseCollapsed
        setLicenseButtonTitle()
        disableLicenseButton()
        delegate?.toggleLicense(license: self, section: section)
    }
    
    fileprivate func setLicenseButtonTitle() {
        licenseButton.setTitle(!licenseCollapsed ? "licensy.general.app.libraries.button.hide_license".localized : "licensy.general.app.libraries.button.show_license".localized , for: .normal)
    }
    
    fileprivate func disableLicenseButton() {
        licenseButton.isEnabled = false
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(300), execute: {
            self.licenseButton.isEnabled = true
        })
    }
    
    
    /// Open a given url for the selected library
    ///
    /// - Parameter sender: UIButton
    @IBAction func openUrlLink(_ sender: UIButton) {
        let targetURL = URL(string: (self.urlButton.titleLabel?.text)!)!
        let application = UIApplication.shared
        application.openURL(targetURL)
    }
    
}


