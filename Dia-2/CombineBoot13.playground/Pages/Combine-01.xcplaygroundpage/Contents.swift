/*
    Publicadores. Arrays enteros.
 */
import Combine

print("--------------------------------------------------")
print(" Ejerc-1. Array de Enteros. Sink")
print("--------------------------------------------------")

let publisher1 = [1,2,3,4,5].publisher

//suscriptor morira...
publisher1
    .sink { completion in
        switch completion{
        case .failure:
            print("fallo")
        case .finished:
            print("Finalizado")
        }
    } receiveValue: { data in
        print("ejerc-1  recibo: \(data)")
    }



