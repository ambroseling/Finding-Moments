//
//  HomeView.swift
//  Moments
//
//  Created by Ambrose Ling on 29/10/2024.
//

import Foundation

import SwiftUI

struct HomeView: View {
    
    
    var body: some View {
        VStack{
            HStack{
                Text("Cherish these moments")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.leading)
                Spacer()

            }

            Button(action: {
                //
            }) {
                Image(systemName: "eye")
                    .resizable()
                    .frame(width: 20, height: 20)
                Text("View moments")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
            }
            Spacer()    


            Button(action: {
                //
            }) {
                Image(systemName: "plus")
                    .resizable()
                    .frame(width: 20, height: 20)
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
    
}
