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
            
        }
    }
}

// add post form view


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




