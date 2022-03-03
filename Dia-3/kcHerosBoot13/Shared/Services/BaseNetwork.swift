//
//  BaseNetwork.swift
//  kcHerosBoot13
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 3/3/22.
//

import Foundation
// let server = "http://172.0.0.1:8080" //Vapor Local
let server = "https://kcbootcamp.herokuapp.com" //Esto es el servidor del API Rest de Heros

struct HTTPMethods{
    static let post = "POST"
    static let get = "GET"
    static let put = "PUT"
    static let delete = "DELETE"
    static let content = "application/json"
}

//endpoints
enum endpoints : String{
    case login = "/api/auth/login"
    case heroList = "/api/heros/all"
}


struct BaseNetwork {
    func getSessionLogin(user:String, password:String) -> URLRequest {
        let urlCad :  String = "\(server)\(endpoints.login.rawValue)"
        let encodeCrentials = "\(user):\(password)".data(using: .utf8)?.base64EncodedString()
        
        var segCrential :String = ""
        if let credentials = encodeCrentials{
            segCrential = "Basic \(credentials)"
        }
        
        //Creamos la Request
        var request =  URLRequest(url: URL(string: urlCad)!)
        request.httpMethod = HTTPMethods.post
        request.addValue(HTTPMethods.content, forHTTPHeaderField: "Content-type") //es JSOn
        request.addValue(segCrential, forHTTPHeaderField: "Authorization")
        
        return request
        
    }
    
    func getSessionHeros(filter:String) -> URLRequest{
        let urlCad :  String = "\(server)\(endpoints.heroList.rawValue)"
        //Creamos la Request
        var request =  URLRequest(url: URL(string: urlCad)!)
        request.httpMethod = HTTPMethods.post
        
        //hay que mandar en el body de la llamada el JSON del filtro.
        request.httpBody = try? JSONEncoder().encode(HerosFilter(name: filter))
        
        //Cabecera de seguridad
        let tokenOptional = loadKC(key: CONST_TOKEN_ID)
        if let tokenJWT = tokenOptional{
            request.addValue("Bearer \(tokenJWT)", forHTTPHeaderField: "Authorization")
        }
        request.addValue(HTTPMethods.content, forHTTPHeaderField: "Content-type") //es JSON
        
        
        
        return request
    }
    
    
}
