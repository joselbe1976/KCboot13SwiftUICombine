//
//  ButtonActionView.swift
//  SwiftUIIntro
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 24/1/22.
//

import SwiftUI

/*
 El property wrapper es una clase donde tiene el valor...
 */

struct ButtonActionView: View {
   @State var imageChange: Bool = false
    
    var body: some View {
        
        VStack{
            
            switch imageChange{
            case true:
                Image(systemName: "sun.max")
                    .resizable()
                    .foregroundColor(.yellow)
                    .frame(width: 200, height: 200, alignment: .center)
                    .padding()
            case false:
                Image(systemName: "cloud.rain")
                    .resizable()
                    .foregroundColor(.black)
                    .frame(width: 200, height: 200, alignment: .center)
                    .padding()
                
            }
            
            Button {
                imageChange.toggle()
                
            } label: {
                Text("Cambiar el tiempo")
                    .padding()
                    .foregroundColor(.white)
                    .background(.blue)
                    .font(.title2)
                    .cornerRadius(20)
                
            }

        }
        
    }
}

struct ButtonActionView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonActionView()
    }
}
