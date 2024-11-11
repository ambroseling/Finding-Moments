//
//  HomeView.swift
//  Moments
//
//  Created by Ambrose Ling on 29/10/2024.
//

import Foundation

import SwiftUI

struct HomeView: View {
    var model: CLIP
    
    var body: some View {
        
        
        ScrollView{
            VStack{
            Text("Moments")
                .font(.largeTitle)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity,alignment:.leading)
                .padding()
            HStack{
                Text("Remember the time you shared that coffee with someone special")
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .bottomTrailing)
                    .padding()
                Spacer()
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/,style: .circular)
                    .aspectRatio(1.0, contentMode: .fit)
                    .padding()
                
            }
            HStack{
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/,style: .circular)
                    .aspectRatio(1.0, contentMode: .fit)
                    .padding()
                Spacer()
                Text("Or the time you had that dinner with your family")
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .bottomTrailing)
                    .padding()
                
            }
                Text("We help you find it.").font(.title)
        }

    }
        Button(action: {
            //
        }) {
            Text("View moments")
                .font(.title)
                .fontWeight(.bold)
                .padding()
        }
        Spacer()
        
        
        Button(action: {
//            let embeddings = model.generateTextEmbedding(text: <#T##String#>)
        }) {
            Text("Create moments")
                .font(.title)
                .fontWeight(.bold)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
}
    
}
