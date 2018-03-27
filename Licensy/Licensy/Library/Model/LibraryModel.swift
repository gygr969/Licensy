//
//  LibraryModel.swift
//  Licensy
//
//  Created by Guillermo García Rebolo on 27/3/18.
//  Copyright © 2018 RetoLabs. All rights reserved.
//

public class LibraryModel: Decodable {
    
    /// The name of the library
    var name: String
    /// The name of the company / organization
    var organization: String
    /// The library url. Usually a github url
    var url: String
    /// The copyright (usually in format "Copyright (c) [YEAR] [NAME]")
    var copyright: String
    /// The license of the library.
    var license: String
}
