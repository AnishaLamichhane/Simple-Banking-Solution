//
//  HomeView.swift
//  simpleBanking
//
//  Created by Anisha Lamichhane on 6/9/21.
//

import SwiftUI

struct HomeView: View {
    @State private var showingAddTransaction = false
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack {
                   Text("Simple Banking Solution")
                    .font(.title2)
                    .padding()
                    Image("bank")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width)
                        .padding(.bottom)
                    
                    Button("Add Transaction") {
                        self.showingAddTransaction.toggle()
                    }
                    .clipShape(Capsule())
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.accentColor)
                    .cornerRadius(8)
                    .padding(.top)
                    
                }
            }
        }
        .navigationBarTitle("Home", displayMode: .inline)
        .sheet(isPresented: $showingAddTransaction) {
//         here we need to write values in the environment
          AddTransaction()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
