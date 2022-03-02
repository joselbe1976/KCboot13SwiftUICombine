/*
  Ejemplo de Asyn Await - Descarga de bootcamps de red
 */

import SwiftUI
import Foundation

//modelo
struct BootCamps : Codable {
    let id:UUID
    let name:String
}


//funcion asincrona

func DownloadBootcamps() async throws -> [BootCamps] {
    let url = URL(string: "https://kcbootcamp.herokuapp.com/api/data/bootcamps")!
    let (data, _) = try await URLSession.shared.data(from: url)
    return try JSONDecoder().decode([BootCamps].self, from: data)
}


//ejecutamos la funcion y contamos el numero de bootcamps. 
Task {
    let boots = try await DownloadBootcamps()
    boots.count
}
