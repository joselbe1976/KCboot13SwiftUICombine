//
//  ZStackView.swift
//  SwiftUIIntro
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 24/1/22.
//

import SwiftUI

struct ZStackView: View {
    var body: some View {
        ZStack{
            Image(decorative: "linterna")
                .resizable()
                .frame(width: 200, height: 200, alignment: .center)
            
            Image(decorative: "")
                .resizable()
                .background(.black)
                .frame(width: 200, height: 200, alignment: .center)
                .opacity(0.4)
            VStack{
                Spacer()
                Text("Linterna Verde")
                    .font(.title)
                    .foregroundColor(Color.white)
                    .offset(x: -10, y: -10)
            }
                
            
        }
    }
}

struct ZStackView_Previews: PreviewProvider {
    static var previews: some View {
        ZStackView()
            .previewLayout(.fixed(width: 200, height: 200))
    }
}
