//
//  HerosMenager.swift
//  ProjComicsMarvel
//
//  Created by test on 28/03/23.
//

import Foundation

class SaveHerosApi: Codable{
    let name: String
    let descripion: String
    let urlImage: String
    let urlWebSave: String
    
    init(name: String, descripion: String, urlImage: String, urlWebSave: String) {
        self.name = name
        self.descripion = descripion
        self.urlImage = urlImage
        self.urlWebSave = urlWebSave
    }
    
}


