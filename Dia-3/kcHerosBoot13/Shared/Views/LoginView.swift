//
//  LoginView.swift
//  kcHerosBoot13
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 3/3/22.
//

import SwiftUI

struct LoginView: View {
    
   @EnvironmentObject var rootViewModel : RootViewModel
    
   @State private var mail  = "" //usuario
   @State private var password = "" //Clave
   @State private var animationMonth = 1.0
    
    var body: some View {
        ZStack{
            Image(decorative: "backgroundLogin")
                .resizable()
                .opacity(1)
            
            //Capa negra
            
            Image(decorative: "")
                .resizable()
                .background(Color.black)
                .opacity(0.3)
            
            
            VStack{
                Image(decorative: "titleMarvel")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
                    .opacity(0.8)
                    .padding(.top, 150)
                    //.offset(x:100, y: -10)
                
                
                
                Spacer()
                
                // Los datos del login
                VStack{
                    TextField("Email", text: $mail)
                        .padding()
                        .background(Color.white)
                        .foregroundColor(.blue)
                        .cornerRadius(20.0)
                        .opacity(0.8)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    
                    SecureField("Clave" , text: $password)
                        .padding()
                        .background(Color.white)
                        .foregroundColor(.blue)
                        .cornerRadius(20.0)
                        .opacity(0.8)
                        .padding(.top, 30)
                        .autocapitalization(.none) //no auto capitalizacion
                        .disableAutocorrection(true)
                }
                .padding([.trailing, .leading], 20)
                
                //Login Button
                Button {
                    //login de la App
                    rootViewModel.login(user: mail, password: password)
                    
                    
                } label: {
                    Text("Entrar")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(
                            //personalizado
                            Color(uiColor: UIColor(red: 221.0/255.0, green: 99.0/255.0, blue: 0.0, alpha: 1.0))
                        )
                        .cornerRadius(15.0)
                        //.shadow(color: .red, radius: 10.0, x: 20, y: 10)
                }
                .padding(.top, 50)
                .opacity(0.8)
                //la animacion
                .overlay(
                    Circle()
                        .stroke(.white)
                        .scaleEffect(animationMonth)
                        .opacity(2-animationMonth)
                        .animation(
                            .easeInOut(duration: 1).repeatForever() //1 segundo la animacion
                            , value: animationMonth)
                        .padding(.top, 50)
                )
                .onAppear{
                    animationMonth = 2
                }
                Spacer()
                //Register Button
                
                HStack{
                    Text("¿No tienes cuenta?")
                        .foregroundColor(Color.white)
                        .bold()
                    Button {
                        //TODO: action here
                    } label: {
                        Text("Registro")
                            .foregroundColor(.blue)
                    }
                }
                .padding(.bottom, 20)
            
            
            }
            
            
            
        }
        .ignoresSafeArea()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environment(\.locale, .init(identifier: "en"))
    }
}
