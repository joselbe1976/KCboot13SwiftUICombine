//
//  EmpleadoRowView.swift
//  kcMultiplataforma13
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 2/3/22.
//

import SwiftUI

struct EmpleadoRowView: View {
    let employee:Empleados //un empleado
    
    var body: some View {
        VStack{
            Spacer()
            
            #if os(watchOS)
            Image(systemName: "person")
                .resizable()
                .frame(width: 100, height:100, alignment: .center)
            
            Text("\(employee.nombre)")
            
            #else
            //Para IOS
            Image(systemName: "person")
                .resizable()
                .frame(width: 100, height:100, alignment: .center)
        
            HStack{
                Spacer()
                Text("\(employee.nombre)")
                Text("\(employee.apell1)")
                //Desempaqueto segurto.
                if let apell2 = employee.apell2{
                    Text("\(apell2)")
                }
                Spacer()
                
            }
            
            #endif
            
            
            Spacer()
        }
        
        
        
    }
}

struct EmpleadoRowView_Previews: PreviewProvider {
    static var previews: some View {
        EmpleadoRowView(employee: Empleados(id: "1223", nombre: "testing", apell1: "Bustos", apell2: nil, idPhoto: "", edad: 40))
            .previewLayout(.fixed(width: 400, height: 200))
    }
}
