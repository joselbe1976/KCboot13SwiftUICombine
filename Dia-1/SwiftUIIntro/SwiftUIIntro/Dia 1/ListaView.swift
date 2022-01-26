//
//  ListaView.swift
//  SwiftUIIntro
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 24/1/22.
//

import SwiftUI

struct ListaView: View {
    var body: some View {
        List{
            Text("Thor")
            Text("Spiderman")
            Text("Capitan America")
        }
    }
}

struct ListaView_Previews: PreviewProvider {
    static var previews: some View {
        ListaView()
    }
}
