//
//  ContentView.swift
//  ServiceExchange
//
//  Created by jluu on 11/8/23.
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

            GroupView()
                .tabItem {
                    Image(systemName: "person.2")
                    Text("Group")
                }

            ExchangeView()
                .tabItem {
                    Image(systemName: "arrow.triangle.2.circlepath")
                    Text("Exchange")
                }

            ProfileView()
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("Profile")
                }
            
            // testing
            LoginView()
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("Login")
                }
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
