//
//  VHStackView.swift
//  SwiftUIIntro
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 24/1/22.
//

import SwiftUI

struct VHStackView: View {
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text("Nombre")
                Text("KeepCoder?")
            }
            .padding(10)
            
            HStack{
                Text("Apellidos")
                Text("Jeecoder")
            }
            .padding(20)
            .background(Color.red)
        }
        .background(Color.yellow)
        
    }
}

struct VHStackView_Previews: PreviewProvider {
    static var previews: some View {
        VHStackView()
    }
}
