//
//  GroupView.swift
//  ServiceExchange
//
//  Created by jluu on 11/8/23.
//

import SwiftUI


struct GroupListView: View {
    @AppStorage("groups") var groupData: Data = Data()
    
    var groups: [Group] {
        get {
            (try? JSONDecoder().decode([Group].self, from: groupData)) ?? []
        }
        set {
            groupData = (try? JSONEncoder().encode(newValue)) ?? Data()
        }
    }

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
        GroupListView()
    }
}

struct GroupView_Previews: PreviewProvider {
    static var previews: some View {
        GroupView()
    }
}
