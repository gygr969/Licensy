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
    @IBOutlet weak var arrow: UIImageView!
    @IBOutlet weak var footerView: UIView!
    
    fileprivate var parentTable: LibrariesTable!
    fileprivate var delegate: HeaderViewDelegate!
    fileprivate var section: Int = 0
    
    func configureHeader(_ name: String, section: Int, parentTable: LibrariesTable, delegate: HeaderViewDelegate) {
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
        arrow.tintColor = appearance.headerContentColor
        footerView.backgroundColor = appearance.headerContentColor
        contentView.backgroundColor = appearance.headerBackgroundColor
    }
    
    func setCollapsed(_ collapsed: Bool) {
        arrow.rotate(collapsed ? 0.0 : CGFloat(M_PI_2))
        self.isUserInteractionEnabled = false
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(300), execute: {
            self.isUserInteractionEnabled = true
        })
    }
    
}
