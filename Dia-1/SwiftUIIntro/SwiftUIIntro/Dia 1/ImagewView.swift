//
//  ImagewView.swift
//  SwiftUIIntro
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 24/1/22.
//

import SwiftUI

struct ImagewView: View {
    var body: some View {
    /* Image(systemName: "house")
            .resizable()
            .frame(width: 200  , height: 200, alignment: .center)
     */
        VStack{
        
            Image(decorative: "linterna")
                .resizable()
                .frame(width: 200, height: 200, alignment: .center)
                .cornerRadius(20)
      
            //IOS 15 (5.5)
            AsyncImage(url: URL(string: "https://e00-elmundo.uecdn.es/assets/multimedia/imagenes/2021/10/05/16334350341494.jpg")) { foto in
                
                foto
                    .resizable()
                
                
            } placeholder: {
                Text("Cargando...")
            }
        }

        
    }
}

struct ImagewView_Previews: PreviewProvider {
    static var previews: some View {
        ImagewView()
    }
}
