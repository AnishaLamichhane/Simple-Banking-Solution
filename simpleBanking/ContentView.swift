//
//  ContentView.swift
//  simpleBanking
//
//  Created by Anisha Lamichhane on 6/9/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            UserView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Users")
                        .padding(.bottom)
                }
            TransactionView()
                .tabItem {
                    Image(systemName: "folder")
                    Text("Transactions")
                }
        }
        .accentColor(.green)
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
