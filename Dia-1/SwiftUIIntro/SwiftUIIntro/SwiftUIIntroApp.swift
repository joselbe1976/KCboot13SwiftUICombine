//
//  SwiftUIIntroApp.swift
//  SwiftUIIntro
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 24/1/22.
//

import SwiftUI

@main
struct SwiftUIIntroApp: App {
    var body: some Scene {
        //viewmodel global
        WindowGroup {
            FormsView()

        }
    }
}

//Firebase, notificaciones push etc... lo puedes meter en el AppDelegate
