//
//  ProfileView.swift
//  ServiceExchange
//
//  Created by jluu on 11/8/23.
//

import SwiftUI

var testProfilePosts: [Post] = [
    Post(name: "John", item: "Tutoring", location: "Library", time: "10AM"),
    
]

struct ProfileView: View {
    var body: some View {
        ScrollView {
            VStack {
                Image("profileImage")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color.white, lineWidth: 4)
                    )
                    .shadow(radius: 7)
                    .padding(.top, 50)
                
                Text("John Doe")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 20)
                
                HStack(spacing: 30) {
                    VStack {
                        Text("10")
                            .font(.headline)
                            .fontWeight(.bold)
                        Text("Posts")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    
                    VStack {
                        Text("5")
                            .font(.headline)
                            .fontWeight(.bold)
                        Text("Exchanges")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    
                    VStack {
                        Text("3.9")
                            .font(.headline)
                            .fontWeight(.bold)
                        Text("rating")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
                .padding()
                
                Spacer()
                
                PostListView(posts: testProfilePosts)
            }
        }
        .navigationBarTitle("Profile")
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
