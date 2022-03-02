//
//  FormsView.swift
//  SwiftUIIntro
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 24/1/22.
//

import SwiftUI



struct FormsView: View {
    @State  var name:String = "Hola"
    @State  var apell1:String = ""
    @State  var hasChildren:Bool = false
    
    @State var hola :Bool = false //warpper en una clase
    
    private var categorias = ["programador", "analista"]
    @State var selectedCategory = "analista"
    
        
    var body: some View {
        NavigationView{
            Form(){
                Section("Datos Empleado") {
                    //los controles
                    TextField("Nombre", text: $name)
                    TextField("Apellido 1", text: $apell1)
                }
                
                Section("Familia"){
                    Toggle("Tienes Hijos", isOn: $hasChildren)
                }
                
                Section("Datos Laborales"){
                    Picker(selection: $selectedCategory) {
                        //lista de valores
                        
                        ForEach(categorias, id:\.self){ data in
                            Text("\(data)")
                        }
                        
                    } label: {
                        Text("Categoria del empleado")
                    }
                    .pickerStyle(.menu)

                }
                
                Section(""){
                    Button {
                        //Action
                        
                        
                    } label: {
                        HStack{
                            Spacer()
                            Text("Dar de alta")
                            .font(.title2)
                            Spacer()
                        }
                    }
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                  

                }
                
            }
            .onSubmit {
                //evento enviar
            }
    }
        
        
        
    }
}

struct FormsView_Previews: PreviewProvider {
    static var previews: some View {
        FormsView()
    }
}
