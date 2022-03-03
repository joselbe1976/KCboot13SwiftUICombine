//
//  ViewModelHeros.swift
//  kcHerosBoot13
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 3/3/22.
//

import Foundation
import Combine

final class viewModelHeros: ObservableObject {
    @Published var heros : [Hero]?
    @Published var status = Status.none
    
    var suscriptors = Set<AnyCancellable>()
    
    init(testing:Bool = false){
        if (testing){
            getHerosUIDesing()
        } else {
            getHeros(filter: "")
        }
    }
    
    
    
    func getHeros(filter:String){
        status = Status.loading
        
        URLSession.shared
            .dataTaskPublisher(for: BaseNetwork().getSessionHeros(filter: filter))
            .tryMap{
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                          //valido si a fallado para lanzar ERROR
                          throw URLError(.badServerResponse)
                      }
                
                return $0.data
            }
            .decode(type: [Hero].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion{
                case .finished:
                    self.status = .loaded
                case .failure:
                    self.status = .error(error: "Error buscando los Heroes")
                }
            } receiveValue: { data in
                self.heros = data
            }
            .store(in: &suscriptors)

        
    }
    
    
    
    
    
    
    
    
    func getHerosUIDesing() {
        //mokeo unos heroes
        let hero1 = Hero(id: UUID(), name: "Hulk", description: "Caught in a gamma bomb explosion while trying to save the life of a teenager, Dr. Bruce Banner was transformed into the incredibly powerful creature called the Hulk. An all too often misunderstood hero, the angrier the Hulk gets, the stronger the Hulk gets.", photo: "http://i.annihil.us/u/prod/marvel/i/mg/5/a0/538615ca33ab0/portrait_incredible.jpg", favorite: true)
        
        let hero2 = Hero(id: UUID(), name: "Capitan america", description: "Caught in a gamma bomb explosion while trying to save the life of a teenager, Dr. Bruce Banner was transformed into the incredibly powerful creature called the Hulk. An all too often misunderstood hero, the angrier the Hulk gets, the stronger the Hulk gets.", photo: "http://i.annihil.us/u/prod/marvel/i/mg/6/80/5269608c1be7a/portrait_incredible.jpg", favorite: true)
        
        let hero3 = Hero(id: UUID(), name: "Spiderman", description: "Caught in a gamma bomb explosion while trying to save the life of a teenager, Dr. Bruce Banner was transformed into the incredibly powerful creature called the Hulk. An all too often misunderstood hero, the angrier the Hulk gets, the stronger the Hulk gets.", photo: "http://i.annihil.us/u/prod/marvel/i/mg/5/a0/538615ca33ab0/portrait_incredible.jpg", favorite: true)
        
        
        self.heros  =  [hero1, hero2,hero3]
    }
}
