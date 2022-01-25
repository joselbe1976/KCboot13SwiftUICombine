//
//  ButtonsView.swift
//  SwiftUIIntro
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 24/1/22.
//

import SwiftUI

struct ButtonsView: View {
    var body: some View {
        VStack {
            Button("Boton primero en SwiftUI") {
                //acciont here
                print("click boton")
            }
            
            
            Button {
               //Accion
            } label: {
                //vista
                HStack{
                    Image(systemName: "pencil.slash")
                        .resizable()
                        .frame(width: 100, height: 100, alignment: .center)
               
                
                    Text("mi primer boton guay")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .font(.title)
                        .cornerRadius(20)
                }
                .background(.red)
            }
        }
        
        

    }
}

struct ButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsView()
    }
}
