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
    
    fileprivate var parentTable: LicensyTable!
    fileprivate var delegate: HeaderViewDelegate!
    fileprivate var section: Int = 0
    
    func configureHeader(_ name: String, section: Int, parentTable: LicensyTable, delegate: HeaderViewDelegate) {
        self.libraryLabel.text = name
        self.parentTable = parentTable
        self.section = section
        self.delegate = delegate
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tapHeader(gestureRecognizer:)))
        self.addGestureRecognizer(tap)
        
        applyAppearance()
    }
    
    func tapHeader(gestureRecognizer: UITapGestureRecognizer) {
        guard let cell = gestureRecognizer.view as? HeaderView else {
            return
        }
        
        delegate?.toggleSection(header: self, section: cell.section)
    }
    
    func applyAppearance() {
        let appearance = parentTable.appearance
        
        libraryLabel.textColor = appearance.headerContentColor
        accesoryImage.tintColor = appearance.headerContentColor
        footerView.backgroundColor = appearance.headerContentColor
        contentView.backgroundColor = appearance.headerBackgroundColor
        
        accesoryImage.image = appearance.accesory == .arrow ? UIImage(named: "Arrow") : UIImage(named: "Plus")
    }
    
    func setCollapsed(_ collapsed: Bool) {
        let appearance = parentTable.appearance
        
        if appearance.accesory == .arrow {
            accesoryImage.rotate(collapsed ? 0.0 : CGFloat(M_PI_2))
        } else if appearance.accesory == .plus {
            accesoryImage.image = !collapsed ? UIImage(named: "Plus") : UIImage(named: "Minus")
        }
        
        self.isUserInteractionEnabled = false
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(300), execute: {
            self.isUserInteractionEnabled = true
        })
    }
    
}
