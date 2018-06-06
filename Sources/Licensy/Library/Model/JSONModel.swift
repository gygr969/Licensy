//
//  JsonModel.swift
//  Licensy
//
//  Created by Guillermo García Rebolo on 27/3/18.
//  Copyright © 2018 RetoLabs. All rights reserved.
//

public class JSONModel: Decodable {
    
    /// The collection of libraries
    var libraries: [LibraryModel]
}
