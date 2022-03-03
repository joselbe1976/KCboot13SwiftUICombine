//
//  kcHerosBoot13App.swift
//  Shared
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 3/3/22.
//

import SwiftUI

@main
struct kcHerosBoot13App: App {
    
    //aqui es globalllll
    
    @StateObject var rootViewModel = RootViewModel() //global a la App
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(rootViewModel)
        }
    }
}
