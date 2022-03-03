//
//  RootView.swift
//  kcHerosBoot13
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 3/3/22.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var rootViewModel : RootViewModel
    
    var body: some View {
        //Caja de estado
        
        switch rootViewModel.status {
        case Status.none:
            LoginView() //Cargo el login
        case Status.register:
            Text("Register")
        case Status.loading:
            LoaderView()
        case Status.error(error: let errorString):
            ErrorView(error: errorString)
        case Status.loaded:
            HeroesView() //la home con los heroes
        }
        
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
