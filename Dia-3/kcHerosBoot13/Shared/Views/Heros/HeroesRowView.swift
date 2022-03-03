//
//  HeroesRowView.swift
//  kcHerosBoot13
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 3/3/22.
//

import SwiftUI

struct HeroesRowView: View {
    var hero:Hero
    @StateObject private var viewmodel = PhotoViewModel()
    
    var body: some View {
        VStack{
            
            if let photo = viewmodel.photo {
                photo
                    .resizable()
                    .cornerRadius(10)
                    .aspectRatio(contentMode: .fit)
                    .padding([.leading, .trailing], 20)
                    .opacity(0.6)
            } else{
                Image(systemName: "photo")
                    .resizable()
                    .cornerRadius(10)
                    .aspectRatio(contentMode: .fit)
                    .padding([.leading, .trailing], 20)
                    .opacity(0.6)
            }
            
            Text(hero.name)
                .font(.title2)
                .foregroundColor(.gray)
                .bold()
        }
        .onAppear{
            viewmodel.loadImage(url: hero.photo)
        }
    }
}

struct HeroesRowView_Previews: PreviewProvider {
    static var previews: some View {
        HeroesRowView(hero:  Hero(id: UUID(), name: "Hulk", description: "Caught in a gamma bomb explosion while trying to save the life of a teenager, Dr. Bruce Banner was transformed into the incredibly powerful creature called the Hulk. An all too often misunderstood hero, the angrier the Hulk gets, the stronger the Hulk gets.", photo: "http://i.annihil.us/u/prod/marvel/i/mg/5/a0/538615ca33ab0/portrait_incredible.jpg", favorite: true))
    }
}
