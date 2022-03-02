//
//  TabView.swift
//  SwiftUIIntro
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 24/1/22.
//

import SwiftUI

struct TabControlView: View {
    var body: some View {
   
        TabView{
            
            //Tab 1
            SwiftUIView()
                .tabItem{
                    Image(systemName: "star")
                    Text("uno")
                }
            
            
            //Tab 2
            ButtonActionView()
                .tabItem{
                    Image(systemName: "home")
                    Text("dos")
                }
            
        }
        
        
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabControlView()
    }
}
