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
        let bundle: Bundle = Bundle(for: LibraryEntity.self)
        guard let podBundle: Bundle = self.podBundle(fromBundle: bundle) else { return bundle }
        return podBundle
    }
    
    //MARK: - Private Methods
    
    private class func podBundle(fromBundle bundle: Bundle) -> Bundle? {
        guard let bundleURL: URL = bundle.url(forResource: "Licensy", withExtension: "bundle") else { return nil }
        guard let podBundle: Bundle = Bundle(url: bundleURL) else { return nil }
        return podBundle
    }
}
