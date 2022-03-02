//
//  CompositionView.swift
//  SwiftUIIntro
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 25/1/22.
//

import SwiftUI

struct CompositionView: View {
    var body: some View {
        VStack {
            VStack{
                Text("Hola")
            }
            .frame(width: 200, height: 200)
            .background(Color.blue)
            .padding([.top],100)
            
            Text("Hola")
                .offset(x: 30)
            
            Spacer()
            
            Button {
                //Action here
            } label: {
                HStack{
                    Spacer()
                    Text("Hacer login")
                        .padding()
                    Spacer()
                }
            }
            .foregroundColor(Color.white)
            .background(Color.blue)
            .cornerRadius(20)
            .padding([.bottom],40)
            .padding([.leading, .trailing],20)
            
    
            
            
        }

        
    }
}

struct CompositionView_Previews: PreviewProvider {
    static var previews: some View {
        CompositionView()
    }
}
