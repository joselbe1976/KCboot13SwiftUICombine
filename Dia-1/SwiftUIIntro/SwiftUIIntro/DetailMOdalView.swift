//
//  DetailMOdalView.swift
//  SwiftUIIntro
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 24/1/22.
//

import SwiftUI

struct DetailMOdalView: View {
    // referencia a memoria (osea un puntero...)
    @Binding var showDetail : Bool
    
    
    var body: some View {
        VStack{
            Text("Detalle Modal")
                .padding(20)
            Button {
                showDetail.toggle()
            } label: {
                Text("Cerrar el modal")
                    .padding()
                    .foregroundColor(.white)
                    .background(.red)
                    .cornerRadius(8)
            }

        }
    }
}
