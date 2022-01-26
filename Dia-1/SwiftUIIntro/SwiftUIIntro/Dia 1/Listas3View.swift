//
//  Listas3View.swift
//  SwiftUIIntro
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 24/1/22.
//

import SwiftUI

struct Listas3View: View {

    @State var heros = [Hero(name: "SuperMan"), Hero(name: "Spiderman"), Hero(name: "Thor")]


    var body: some View {
        NavigationView{
            List{
                ForEach(heros){ data in
                    HStack{
                        Image(systemName: "person")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.blue)
                        Text(data.name)
                    }
                    .padding(10)
                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                        //Vista del Swipe
                        Button {
                            //Action Here
                        } label: {
                            Label("Silenciar", systemImage: "bell.slash")
                        }
                        .tint(.red)
                        
                        if  1 == 1 {
                            Button {
                                //Action Here
                            } label: {
                                Label("Llamar", systemImage: "video.fill")
                            }
                            .tint(.green)
                        }
                        
                    }
                    .swipeActions(edge: .leading, allowsFullSwipe: false) {
                        Button {
                            //Action Here
                        } label: {
                            Label("LLamar", systemImage: "phone")
                        }
                        .tint(Color.gray)
                    }
                    
                    
                }
            }
            .navigationBarTitle("Hola mundo")
            .navigationBarTitleDisplayMode(.large)
        }
        .refreshable{
        
            //Codigo del pull to Request
            heros.append(Hero(name: "Prueba"))
        }
        
        
    }
}

struct Listas3View_Previews: PreviewProvider {
    static var previews: some View {
        Listas3View()
    }
}


//MOdelo
struct Hero: Identifiable{
    let id:UUID = UUID()
    let name:String
}
