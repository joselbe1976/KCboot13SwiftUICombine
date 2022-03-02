//
//  EmployeeDetailView.swift
//  kcMultiplataforma13
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 2/3/22.
//

import SwiftUI

struct EmployeeDetailView: View {
    let employee : Empleados
    
    var body: some View {
        VStack{
            Image(systemName: "person")
                .resizable()
                .frame(width: 100, height: 100, alignment: .center)
            
            #if os(watchOS)
            Text("\(employee.nombre)")
            #else
            VStack{
                Text("\(employee.nombre)")
                    .padding()
                Text("\(employee.apell1)")
                    .padding()
                Text("\(employee.edad)")
                    .padding()
            }
            .foregroundColor(.white)
            .font(.title)
            
            #endif
            
            
        }
        .background(Color.gray)
        
        
    }
}

struct EmployeeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeDetailView(employee: Empleados(id: "1", nombre: "Jose luis", apell1: "Bustios", apell2: "Esteban", idPhoto: "", edad: 20))
    }
}
