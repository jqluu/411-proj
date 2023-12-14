//
//  ProfileView.swift
//  ServiceExchange
//
//  Created by jluu on 11/8/23.
//

import SwiftUI

struct ProfileView: View {
    @AppStorage("profilePosts") private var profilePostsData: Data = Data()
    
    var profilePosts: [Post] {
        get {
            (try? JSONDecoder().decode([Post].self, from: profilePostsData)) ?? []
        }
        set {
            profilePostsData = (try? JSONEncoder().encode(newValue)) ?? Data()
        }
    }
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
                
                 PostListView()
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
