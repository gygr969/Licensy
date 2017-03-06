//
//  LibrariesPaser.swift
//  Licensy
//
//  Created by Guillermo Garcia Rebolo on 22/2/17.
//  Copyright © 2017 RetoLabs. All rights reserved.
//

import UIKit

/// Parses the libraries from a given JSON
public class LibrariesPaser: NSObject {
    
    private(set) var organizer = LicenseOrganizer.sharedInstance
    
    /// Retrive libraries from a JSON file.
    ///
    /// - Parameter filepath: The file path to the JSON file containing the libraries
    /// - Returns: An array of libraries
    public func setLibrariesFromJSONFile(filepath: String) -> Array<LibraryEntity> {
        var libraries : Array<LibraryEntity> = []
        
        if let jsonData = NSData(contentsOfFile: filepath) {
            do {
                let jsonArray = try JSONSerialization.jsonObject(with: jsonData as Data, options: JSONSerialization.ReadingOptions(rawValue: 0)) as! [String: [[String: String]]]
                
                if let librariesArray = jsonArray["libraries"] {
                    for libraryJSON in librariesArray {
                        let name = libraryJSON["name"]!
                        let organization = libraryJSON["organization"]!
                        let url = libraryJSON["url"]!
                        let copyright = libraryJSON["copyright"]!
                        let license = self.organizer.licenseForIndetifier(libraryJSON["license"]!)
                        
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
