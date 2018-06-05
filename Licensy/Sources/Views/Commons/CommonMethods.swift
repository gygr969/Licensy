//
//  CommonMethods.swift
//  Licensy
//
//  Created by Guillermo García Rebolo on 27/3/18.
//  Copyright © 2018 RetoLabs. All rights reserved.
//

/// Common Methods class for the library
public class CommonMethods {
    
    /// Set libraries from a JSON file.
    ///
    /// Returns: The library bundle
    public class func libraryBundle() -> Bundle {
        let podBundle: Bundle = Bundle(for: LibraryEntity.self)
        return podBundle
    }
}
