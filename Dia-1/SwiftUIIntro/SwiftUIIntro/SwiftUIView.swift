//
//  SwiftUIView.swift
//  SwiftUIIntro
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 24/1/22.
//

import SwiftUI

struct SwiftUIView: View {
    let pelis = ["Dragon Ball Z", "Guerra mundial Z", "La mosca", "Superman 2", "MI pequelo poni", "Terminator", "Vengadores"]
    
    
    var body: some View {

        VStack{
            Text("Pelis novedades")
                .font(.title)
                .bold()
            
            Divider()
            
            ScrollView(.horizontal){
                LazyHStack{
                    ForEach(pelis, id:\.self){ data in
                        let _ = print("carga : \(data)")
                        VStack{
                            Image(systemName: "person.3")
                                .resizable()
                                .frame(width: 200, height: 200)
                            Text("\(data)")
                        }
                    }
                }
            }
        }
        
        
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
