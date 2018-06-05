//
//  LibrariesPaser.swift
//  Licensy
//
//  Created by Guillermo Garcia Rebolo on 22/2/17.
//  Copyright © 2017 RetoLabs. All rights reserved.
//

/// Parses the libraries from a given JSON
public class LibrariesPaser {
    
    /// Retrive libraries from a JSON file.
    ///
    /// - Parameter filepath: The file path to the JSON file containing the libraries
    /// - Returns: An array of libraries
    public class func setLibrariesFromJSONFile(filepath: String) -> [LibraryEntity] {
        var libraries: [LibraryEntity] = []
        
        guard let jsonData: Data = self.data(for: filepath) else {
            return libraries
        }
        guard let models: [LibraryModel] = self.decode(data: jsonData) else {
            return libraries
        }
        
        libraries = LibraryEntity.map(libraries: models)
        return libraries
    }
    
    //MARK: - Private Methods
    
    private class func data(for filePath: String) -> Data? {
        let fileURL: URL = URL(fileURLWithPath: filePath)
        
        do {
            let jsonData: Data = try Data(contentsOf: fileURL)
            return jsonData
        }
        catch {
            return nil
        }
    }
    
    private class func decode(data: Data) -> [LibraryModel]? {
        do {
            let source: JSONModel = try JSONDecoder().decode(JSONModel.self, from: data)
            return source.libraries
        }
        catch {
            return nil
        }
    }

}
