//
//  HeaderView.swift
//  Licensy
//
//  Created by Guillermo García Rebolo on 22/2/17.
//  Copyright © 2017 RetoLabs. All rights reserved.
//

import UIKit

internal protocol HeaderViewDelegate {
    func toggleSection(header: HeaderView, section: Int)
}

class HeaderView: UITableViewHeaderFooterView {

    @IBOutlet weak var libraryLabel: UILabel!
    @IBOutlet weak var accesoryImage: UIImageView!
    @IBOutlet weak var footerView: UIView!
    @IBOutlet weak var containerView: UIView!
    
    
    fileprivate var parentTable: LicensyTable!
    fileprivate var delegate: HeaderViewDelegate!
    fileprivate var section: Int = 0
    fileprivate var bundle: Bundle {
        let podBundle =  Bundle(for: LibraryEntity.self)
        let bundleURL = podBundle.url(forResource: "Licensy", withExtension: "bundle")
        return Bundle(url: bundleURL!)!
    }
    
    
    func configureHeader(_ name: String, section: Int, parentTable: LicensyTable, delegate: HeaderViewDelegate) {
        self.libraryLabel.text = name
        self.parentTable = parentTable
        self.section = section
        self.delegate = delegate
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tapHeader(gestureRecognizer:)))
        self.addGestureRecognizer(tap)
        
        applyAppearance()
    }
    
    @objc func tapHeader(gestureRecognizer: UITapGestureRecognizer) {
        guard let cell = gestureRecognizer.view as? HeaderView else {
            return
        }
        
        delegate?.toggleSection(header: self, section: cell.section)
    }
    
    func applyAppearance() {
        let appearance = parentTable.appearance
        
        accesoryImage.image = appearance.accesory == .arrow ? UIImage(named: "Arrow.png", in: bundle, compatibleWith: nil)?.withRenderingMode(.alwaysTemplate) : UIImage(named: "Plus.png", in: bundle, compatibleWith: nil)?.withRenderingMode(.alwaysTemplate)
        
        libraryLabel.textColor = appearance.headerContentColor
        accesoryImage.tintColor = appearance.headerContentColor
        footerView.backgroundColor = appearance.headerContentColor
        containerView.backgroundColor = appearance.headerBackgroundColor
    }
    
    func setCollapsed(_ collapsed: Bool) {
        let appearance = parentTable.appearance
        
        if appearance.accesory == .arrow {
            accesoryImage.rotate(collapsed ? 0.0 : CGFloat(Double.pi/2))
        } else if appearance.accesory == .plus {
            accesoryImage.image = collapsed ? UIImage(named: "Plus.png", in: bundle, compatibleWith: nil)?.withRenderingMode(.alwaysTemplate) : UIImage(named: "Minus.png", in: bundle, compatibleWith: nil)?.withRenderingMode(.alwaysTemplate)
        }
        
        self.isUserInteractionEnabled = false
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(300), execute: {
            self.isUserInteractionEnabled = true
        })
    }
    
}
