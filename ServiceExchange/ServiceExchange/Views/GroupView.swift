//
//  GroupView.swift
//  ServiceExchange
//
//  Created by jluu on 11/8/23.
//

import SwiftUI

var testGroups: [Group] = [
    Group(name: "CSUF", members: []),
    Group(name: "Nutwood Neighborhood", members: [])
]

// Displaying posts
struct GroupListView: View {
    var groups: [Group] // Input
    
    var body: some View {
        NavigationView {
            List(groups, id: \.name) { group in
                VStack(alignment: .leading) {
                    Text(group.name)
                        .font(.headline)
                    
                    Text("Members: \(group.members.count)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            .navigationBarTitle("Groups:")
        }
    }
}

struct GroupView: View {
    var body: some View {
        GroupListView(groups: testGroups)
    }
}

struct GroupView_Previews: PreviewProvider {
    static var previews: some View {
        GroupView()
    }
}
