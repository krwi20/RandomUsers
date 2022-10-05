//
//  User.swift
//  RandomUsers
//
//  Created by Kris Wittwer on 05/10/2022.
//

import Foundation

// each User instance will be displayed using a List which requires the items conform to Identifiable
struct User: Identifiable {
    
    let id: String
    let name: Name
    
}

struct Name {
    
    let title: String
    let first: String
    let last: String
    
}
