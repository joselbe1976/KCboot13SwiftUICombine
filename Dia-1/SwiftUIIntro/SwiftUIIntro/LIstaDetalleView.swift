//
//  LIstaDetalleView.swift
//  SwiftUIIntro
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 24/1/22.
//

import SwiftUI

struct LIstaDetalleView: View {
    
    @State var showDetail = false
    
    let heros = [Hero(name: "SuperMan"), Hero(name: "Spiderman"), Hero(name: "Thor")]

    var body: some View {
        NavigationView{
            List{
                ForEach(heros){ hero in
                    NavigationLink {
                        //Destino
                        HeroDetailView(data: hero)
                      
       
                    } label: {
                        //SubVista
                        HeroRowView(data: hero)
                    }

                }
            }
            .navigationBarTitle("Heroes")
            .toolbar{
                ToolbarItem(placement: .bottomBar) {
                    Button("Open"){
                        //accion del boton
                        showDetail.toggle()
                    }
                }
            }
            .sheet(isPresented: $showDetail) {
                //Dimiss (actions)
            } content: {
                //que veo en el modal
                DetailMOdalView(showDetail: $showDetail )
            }

        }
       
        
        
    }
}

struct LIstaDetalleView_Previews: PreviewProvider {
    static var previews: some View {
        LIstaDetalleView()
    }
}


//El detalle
struct HeroDetailView: View {
    var data: Hero
    var body: some View {
        VStack{
            Text("Detalle de... \(data.name)")
        }
    }
}

//Celda personbalizada de la lista

struct HeroRowView: View {
    var data: Hero
    var body: some View {
        HStack{
            Image(systemName: "person")
                .resizable()
                .frame(width: 50, height: 50)
            Text(data.name)
        }
        .padding(5)
    }
}
