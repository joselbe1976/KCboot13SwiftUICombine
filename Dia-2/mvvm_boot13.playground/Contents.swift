//: A UIKit based Playground for presenting user interface
 
/*
     KeepCoding. Ejemplo de como funciona MVVM con SwiftUI y Combine
 */

import SwiftUI
import PlaygroundSupport


// ------------   Modelos ------------------

struct Person:Codable{
    let id:UUID
    let name:String
    let apells:String
    let nif:String
}
enum Estados {
    case none, loading, loaded, error
}

// ------------   ViewModels ------------------

final class ViewModelPerson : ObservableObject{
    @Published var data:Person?
    @Published var estado = Estados.none // Estado en el que se encuentra
    
    init(){
        estado = .none
        loadPerson()
    }
    // async load Simulate
    func loadPerson(){
        estado = .loading
        // ejecucion asincrona (simulamos backend + red) 2 segundos de delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.data = Person(id: UUID(), name: "Manuel", apells: "Martinez Bustos", nif: "52765432G")
            self.estado = .loaded
        }
        
    }
}



// ------------   Views  ------------------

struct ContentView: View {
    @StateObject private var viewModel = ViewModelPerson()
    //@ObservedObject private var viewmodel = ViewModelPerson()
    /*
        https://www.hackingwithswift.com/quick-start/swiftui/what-is-the-stateobject-property-wrapper
        Porque hay que usar StateObejct (SwiftUI 2) en vez de ObservedObject (SwiftUI 1)
     */
    
    var body: some View {
        switch viewModel.estado {
        case Estados.none:
            Text("Estado None")
            
        case Estados.loading:
            Text("Cargando datos")
               
        case Estados.error:
            Text("Se ha producido un error")
               
        case Estados.loaded:
            VStack(alignment: .leading){
                if let data = viewModel.data {
                    Image(systemName: "person.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                    Text("\(data.name) \(data.apells)")
                        .font(.caption)
                }
                else{
                    Text("No data")
                }
            }
            .padding()
            .onReceive(self.viewModel.$data) { (data) in
                if let datos = data {
                    print("Cambia el dato \(datos.name)")
                }
            }
            .onReceive(self.viewModel.$estado) { estado in
               print("cambia el estado")
            }
        }
        
    }
    
}

// ejecuta la salida de la vista en el playGround
PlaygroundPage.current.setLiveView(ContentView().frame(width: 200, height: 100))


