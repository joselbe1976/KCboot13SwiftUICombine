//
//  ContentView.swift
//  Shared
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 2/3/22.
//

import SwiftUI

struct ContentView: View {
    
    //Empleados
    private var Employees = getTestData()
    
    var body: some View {
        NavigationView{
            List{
                ForEach(Employees){ employee in
                    
                    NavigationLink {
                        EmployeeDetailView(employee: employee)
                        
                    } label: {
                        EmpleadoRowView(employee: employee)
                    }

                    
                    
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
