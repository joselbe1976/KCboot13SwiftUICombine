//
//  ErrorView.swift
//  kcHerosBoot13
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 3/3/22.
//

import SwiftUI

struct ErrorView: View {
    @EnvironmentObject var rootViewModel : RootViewModel
    
    private var TextError:String
    init(error:String){
        self.TextError = error
    }
    
    var body: some View {
        VStack{
            Spacer()
            
            Image(systemName: "exclamationmark.triangle")
                .resizable()
                .foregroundColor(.red)
                .frame(width: 200, height: 200)
                .padding()
            
            Text(TextError)
                .foregroundColor(.red)
                .font(.headline)
            
            Spacer()
            
            Button {
                rootViewModel.status = .none
                
            } label: {
                Text("Volver")
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.orange)
                    .cornerRadius(20)
                
                
            }

        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(error: "Error de Ejemplo")
    }
}
