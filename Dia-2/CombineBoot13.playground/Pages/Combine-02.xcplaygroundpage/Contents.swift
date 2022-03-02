/*
 Suscriptores. Almacenamiento
 */

import Combine


print("--------------------------------------------------")
print(" Ejerc-1. GUardo el suscriptor")
print("--------------------------------------------------")

let publisher1 = [1,2,3,4,5].publisher

let suscriptor1 = publisher1
    .sink { data in
        print("Ejerc-1 dato: \(data)")
    }


print("--------------------------------------------------")
print(" Ejerc-2. Guardo en un AnyCancelable")
print("--------------------------------------------------")

let suscriptor2 : AnyCancellable?
      
suscriptor2 = publisher1
          .sink { data in
              print("Ejerc-2 dato: \(data)")
          }


print("--------------------------------------------------")
print(" Ejerc-3. Store para extraer el suscriptor")
print("--------------------------------------------------")

var suscriptor3 = Set<AnyCancellable>()


publisher1
    .sink { data in
        print("Ejerc-3 dato: \(data)")
          }
    .store(in: &suscriptor3)
