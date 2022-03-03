//
//  RootViewModel.swift
//  kcHerosBoot13
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 3/3/22.
//

import Foundation
import Combine

public let CONST_TOKEN_ID = "tokenJWTparaelkeychain"


final class RootViewModel: ObservableObject {
    @Published var status = Status.none //estado
    @Published var tokenJWT:String = "" {
        didSet{
            print("Toekn asignado: \(tokenJWT)")
            saveKC(key: CONST_TOKEN_ID, value: tokenJWT) //guardo el Token
        }
    }
    
    var suscribers = Set<AnyCancellable>() //aqui se almacenan los suscriptores
    
    
    
    init(){
        status = .loading
        let token = loadKC(key: CONST_TOKEN_ID)
        if let jwt = token {
            tokenJWT = jwt //validaciones de caducidad del token.
            status = .loaded
        }
        
    }
    
    //Funcion de Login
    func login(user:String, password:String){
        status = .loading
        
        URLSession.shared
            .dataTaskPublisher(for: BaseNetwork().getSessionLogin(user: user, password: password))
            .tryMap{
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                          //si no cumple el codifo 200
                          throw URLError(.badServerResponse)
                      }
                
                //Todo OK, devuelvo el JSON o el Token en este caso
                return String(decoding: $0.data , as: UTF8.self)
            }
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion{
                case .failure:
                    self.status = Status.error(error: "Usuario y/o clave erroneo")
                case .finished:
                    self.status = Status.loaded
                }
            } receiveValue: { data in
                //Tenemos el JWT
                self.tokenJWT = data //Se asigna
            }
            .store(in: &suscribers)

            
    }
    
    
    
    //Close Ssiones
    func closeSession(){
        
    }
}
