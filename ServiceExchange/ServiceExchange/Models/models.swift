//
//  models.swift
//  ServiceExchange
//
//  Created by jluu on 11/8/23.
//

import Foundation


class User {
    var name: String
    var email: String
    var phoneNumber: String
    var exchangesCount: Int
    var averageRating: Double
    // var photo:

    init(name: String, email: String, phoneNumber: String, exchangesCount: Int, averageRating: Double) {
        self.name = name
        self.email = email
        self.phoneNumber = phoneNumber
        self.exchangesCount = exchangesCount
        self.averageRating = averageRating
    }
}

class Post {
    // var user: User
    var name: String
    var item: String
    var location: String
    var time: String
    // var photos: [UIImage]
    
    init(name: String, item: String, location: String, time: String) {
        // self.user = user
        self.name = name
        self.item = item
        self.location = location
        self.time = time
    }
    
}

class Group {
    var name: String
    var members: [User]

    init(name: String, members: [User]) {
        self.name = name
        self.members = members
    }
}
