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
        
        self.accesoryImage.image = appearance.accesory == .arrow ? UIImage(named: "Arrow.png", in: CommonMethods.libraryBundle(), compatibleWith: nil)?.withRenderingMode(.alwaysTemplate) : UIImage(named: "Plus.png", in: CommonMethods.libraryBundle(), compatibleWith: nil)?.withRenderingMode(.alwaysTemplate)
        
        self.libraryLabel.textColor = appearance.headerContentColor
        self.accesoryImage.tintColor = appearance.headerContentColor
        self.footerView.backgroundColor = appearance.headerContentColor
        self.containerView.backgroundColor = appearance.headerBackgroundColor
    }
    
    func setCollapsed(_ collapsed: Bool) {
        let appearance = parentTable.appearance
        
        if appearance.accesory == .arrow {
            self.accesoryImage.rotate(collapsed ? 0.0 : CGFloat(Double.pi/2))
        } else if appearance.accesory == .plus {
            self.accesoryImage.image = collapsed ? UIImage(named: "Plus.png", in: CommonMethods.libraryBundle(), compatibleWith: nil)?.withRenderingMode(.alwaysTemplate) : UIImage(named: "Minus.png", in: CommonMethods.libraryBundle(), compatibleWith: nil)?.withRenderingMode(.alwaysTemplate)
        }
        
        self.isUserInteractionEnabled = false
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(300), execute: {
            self.isUserInteractionEnabled = true
        })
    }
    
}
