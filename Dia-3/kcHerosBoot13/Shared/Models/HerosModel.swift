//
//  HerosModel.swift
//  kcHerosBoot13
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 3/3/22.
//

import Foundation


struct Hero: Codable, Identifiable {
    var id:UUID
    var name:String
    var description:String
    var photo:String //Es una URL
    var favorite:Bool? //sin uso ahora...
}

//para filtrar
struct HerosFilter: Codable{
    var name:String
}
