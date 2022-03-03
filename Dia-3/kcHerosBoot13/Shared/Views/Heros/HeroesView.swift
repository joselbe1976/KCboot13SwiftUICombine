//
//  HeroesView.swift
//  kcHerosBoot13
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 3/3/22.
//

import SwiftUI

struct HeroesView: View {
    
    @StateObject  var viewModel  = viewModelHeros()
    @State private var filter:String=""
    
    var body: some View {
        NavigationView{
            List{
                if let hero = viewModel.heros {
                    ForEach(hero){data in
                        NavigationLink {
                            //Destination
                            HerosDetailView(hero: data)
                        } label: {
                            HeroesRowView(hero: data)
                        }

                    }
                }
            }
        }
    }
}

struct HeroesView_Previews: PreviewProvider {
    static var previews: some View {
        HeroesView(viewModel: viewModelHeros(testing: true))
    }
}
