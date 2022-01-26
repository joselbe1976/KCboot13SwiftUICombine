//
//  StackView.swift
//  SwiftUIIntro
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 24/1/22.
//

import SwiftUI

struct StackView: View {
    var body: some View {
        //VStack
        VStack(alignment: .leading){
            Text("hola")
            Spacer()
            Text("KeepCoders!!")
            Spacer()
            Text("Esto es SwiftIU")
        }
        .font(.title)
        .frame(width: 400, height: 400)
        .background(Color.blue)
        .foregroundColor(.white)

     
        
    }
}

struct StackView_Previews: PreviewProvider {
    static var previews: some View {
        StackView()
    }
}
