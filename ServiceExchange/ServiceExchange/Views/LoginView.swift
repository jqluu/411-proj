//
//  LoginView.swift
//  ServiceExchange
//
//  Created by jluu on 11/8/23.
//

import SwiftUI

struct LoginView: View {
    @AppStorage("storedUsername") private var storedUsername = ""
    @AppStorage("storedPassword") private var storedPassword = ""

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
                    authenticateUser(username: username, password: password)
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

    private func authenticateUser(username: String, password: String) {
        if username == storedUsername && password == storedPassword {
            // Login successful
            print("Login Successful")
        } else {
            // Login failed
            print("Invalid credentials")
        }
    }
}
