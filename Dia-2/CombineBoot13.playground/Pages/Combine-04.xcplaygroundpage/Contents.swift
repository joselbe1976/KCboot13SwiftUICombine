/*
 Notificztion Center

 */


import Foundation
import Combine


print(" --------------------------------------------")
print("  Ejer-1. Notification Center")
print(" --------------------------------------------")


extension Notification.Name {
    static let myNotification = Notification.Name("keepcodingBoot132022")
}


var mensaje:String = "" {
    didSet{ //observador propiedad
        print("Nuevo valor: \(mensaje)")
    }
}


//creo publisher y modificadores de la señal
let publisher  = NotificationCenter.default
    .publisher(for: .myNotification)
    .map{
        $0.object as? String
    }
    .replaceNil(with: "No llega nada")
    .replaceError(with: "Hay error")
    .replaceEmpty(with: "viene vacio")

var suscriptor : AnyCancellable?

suscriptor = publisher.sink(receiveValue: { data in
    mensaje = data
})


let timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { _ in
    //esto se ejecuta cada 3 segundos
    
    NotificationCenter.default.post(name: .myNotification, object: "Hola")
}
