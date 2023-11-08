//
//  LoginView.swift
//  ServiceExchange
//
//  Created by jluu on 11/8/23.
//

import SwiftUI

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                
                Text("Service Exchange")
                    .font(.title)
                    .padding()
                
                TextField("Username", text: $username)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                SecureField("Password", text: $password)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {
                    // Add your authentication logic here
                    // Check if the username and password are valid
                    // If valid, navigate to the next view
                    // If not, show an error message
                }) {
                    Text("Login")
                        .font(.title)
                        .padding()
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                
                NavigationLink(destination: SignUpView()) {
                    Text("Don't have an account? Sign up")
                        .foregroundColor(.blue)
                }
                
                Spacer()
            }
        }
    }
}
