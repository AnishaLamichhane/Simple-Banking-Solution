//
//  UserView.swift
//  simpleBanking
//
//  Created by Anisha Lamichhane on 6/9/21.
//

import SwiftUI

struct UserView: View {
   var body: some View {
        NavigationView {
            List {
                ForEach(1..<15) { i in
//                    NavigationLink(destination: UserDetails()) {
                        HStack {
                        Image(systemName: "person")
                            .font(.largeTitle)
                            .foregroundColor(.orange)
                            VStack(alignment: .leading) {
                                Text("user\(i)")
                                Text("user\(i)@gmail.com")
                                    .foregroundColor(.secondary)
                            }
                            Spacer()
                        
                            Text("$\(Int.random(in: 1000...10000))")
                                .foregroundColor(.green)
                        }
//                    }
                }
            }
            .navigationBarTitle("User List", displayMode: .inline)
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
