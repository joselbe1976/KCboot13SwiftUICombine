//
//  Lista2View.swift
//  SwiftUIIntro
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 24/1/22.
//

import SwiftUI

struct Lista2View: View {
    
    let heros = ["SuperMan", "Spiderman", "Developer"]
    
    var body: some View {
        List{
            ForEach(heros, id:\.self){ data in
                Text(data)
            }
        }
        
    }
}

struct Lista2View_Previews: PreviewProvider {
    static var previews: some View {
        Lista2View()
    }
}
