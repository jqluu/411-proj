//
//  HomeView.swift
//  ServiceExchange
//
//  Created by jluu on 11/8/23.
//

import SwiftUI

// test Posts
var testPosts: [Post] = [
    Post(name: "John", item: "Tutoring", location: "Library", time: "10AM"),
    Post(name: "Bob", item: "Chores", location: "Library", time: "10AM"),
    Post(name: "Mary", item: "Extra food", location: "Library", time: "10AM")
    
]

// displaying posts
struct PostListView: View {
    
    var posts: [Post] // input
    
    @State private var isShowingCreatePostView = false
    
    var body: some View {
        NavigationView {
            // test list
            List(posts, id: \.item) { post in
                VStack(alignment: .leading) {
                    Text("User: \(post.name)")
                        .font(.headline)
                    Text("Item: \(post.item)")
                        .font(.subheadline)
                    Text("Location: \(post.location)")
                        .font(.subheadline)
                    Text("Time: \(post.time)")
                        .font(.subheadline)
                }
            }
            .navigationBarTitle("Offers:")
            .navigationBarItems(trailing:
                            Button(action: {
                                isShowingCreatePostView.toggle()
                            }) {
                                Image(systemName: "plus")
                            }
                        )
                        .sheet(isPresented: $isShowingCreatePostView) {
                            NavigationView {
                                CreatePostView()
                            }
                        }
            
            
        }
    }
}

// create a post view
struct CreatePostView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var postTitle = ""
    @State private var postContent = ""
    @State private var location = ""
    @State private var time = ""
    @State private var description = ""
    @State private var showAlert = false
    
    var body: some View {
            VStack(spacing: 16) {
                Text("Create Post")
                    .font(.title)
                    .padding(.bottom, 20)
                
                TextField("Title of service", text: $postTitle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                TextField("Location", text: $location)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                TextField("Time", text: $time)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Text("Description")
                    .font(.headline)
                    .foregroundColor(.blue)
                
                TextEditor(text: $postContent)
                    .frame(minHeight: 200)
                    .cornerRadius(8)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                
                Spacer()
                
                Button("Save") {
                    // Logic to save the post
                    presentationMode.wrappedValue.dismiss()
                }
                .frame(maxWidth: .infinity)
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(8)
            }
            .padding()
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading:
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.blue)
                }
            )
        }
}

// main home view
struct HomeView: View {
    var body: some View {
        PostListView(posts: testPosts) // pass in input
    }
}

// preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        PostListView(posts: testPosts)
    }
}




