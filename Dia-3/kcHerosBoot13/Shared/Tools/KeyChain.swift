//
//  KeyChain.swift
//  kcHerosBoot13
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 3/3/22.
//

import Foundation
import KeychainSwift

//Guardado en hey chain
@discardableResult func saveKC(key:String, value:String) -> Bool {
    if let data = value.data(using: .utf8){
        let keychain = KeychainSwift()
        keychain.set(data, forKey: key)
        return true
    } else{
        return false
    }
}

//Cargar del KeyChain
func loadKC(key:String) -> String? {
    let keychain = KeychainSwift()
    if let data = keychain.get(key){
        return data
    } else{
        return ""
    }
}


// Eliminar
func deleteKC(key:String){
    let keychain = KeychainSwift()
    keychain.delete(key)
}
