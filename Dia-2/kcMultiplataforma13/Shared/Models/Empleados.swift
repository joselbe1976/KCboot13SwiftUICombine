//
//  Empleados.swift
//  kcMultiplataforma13 (iOS)
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 2/3/22.
//

import Foundation

struct Empleados: Identifiable {
    let id:String
    let nombre:String
    let apell1:String
    let apell2:String? //Empleados sin segundo apellido.
    let idPhoto:String
    let edad:Int
}

func getTestData() -> [Empleados] {
    return [
    Empleados(id: "10010", nombre: "David", apell1: "Martin", apell2: "Martin", idPhoto: "01", edad: 40),
    Empleados(id: "10011", nombre: "Manuel", apell1: "Alonso", apell2: "Azure", idPhoto: "01", edad: 42),
    Empleados(id: "10012", nombre: "Gema", apell1: "Perez", apell2: "Google", idPhoto: "01", edad: 43),
    Empleados(id: "10013", nombre: "Edurne", apell1: "Esteban", apell2: "Hwernandez", idPhoto: "01", edad: 44)
    
    ]
}
