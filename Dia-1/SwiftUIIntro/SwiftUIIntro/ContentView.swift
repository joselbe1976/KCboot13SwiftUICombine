//
//  ContentView.swift
//  SwiftUIIntro
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 24/1/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            Text("1")
            
            Button("Hola333f") {
                //Accion here
            }
            
            Button {
                //Accion
            } label: {
                //No es la label.. sino la vista a mostrar...
                Text("Boton click here")
            }

        }
    }
}

//depuracion en Xcode
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        
        ContentView()
            .previewLayout(.fixed(width: 300, height: 200))
            .preferredColorScheme(.light)
    }
}
