//
//  LibrariesPaser.swift
//  Licensy
//
//  Created by Guillermo Garcia Rebolo on 22/2/17.
//  Copyright © 2017 RetoLabs. All rights reserved.
//

import UIKit

/**
 *  Parses the libraries from a given JSON
 */
public class LibrariesPaser: NSObject {
    
    /**
     *  The object used to resolve licenses.
     */
    public private(set) var organizer = LicenseOrganizer()
    
    /**
     Retrive libraries from a JSON file.
     
     - parameter filepath: The file path to the JSON file containing the libraries.
     
     - returns: An array of libraries
     */
    public func setNoticesFromJSONFile(filepath: String) -> Array<LibraryEntity> {
        var libraries : Array<LibraryEntity> = []
        
        if let jsonData = NSData(contentsOfFile: filepath) {
            do {
                let jsonArray = try JSONSerialization.jsonObject(with: jsonData as Data, options: JSONSerialization.ReadingOptions(rawValue: 0)) as! [String: [[String: String]]]
                
                if let librariesArray = jsonArray["notices"] {
                    for libraryJSON in librariesArray {
                        let name = libraryJSON["name"]!
                        let organization = libraryJSON["organization"]!
                        let url = libraryJSON["url"]!
                        let copyright = libraryJSON["copyright"]!
                        let license = self.organizer.licenseForName(libraryJSON["license"]!)
                        
                        if let licenseType = license {
                            libraries.append(LibraryEntity(name: name, organization: organization, url: url, copyright: copyright, license: licenseType))
                        }
                    }
                }
            } catch let error {
                print(error)
            }
        }
        return libraries
    }

}
