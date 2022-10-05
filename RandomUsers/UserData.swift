//
//  UserData.swift
//  RandomUsers
//
//  Created by Kris Wittwer on 05/10/2022.
//

/* With the UserFetchingClient retrieving random users from the Random User Generator API, you will need a location to store the users. The UserData structure will do just that! */

import Foundation

class UserData: ObservableObject {
    
    // since the randomly generated users is a string
    // published to update any subscribers with the newly published data -> makes userdata need to conform to
    // observableobject to update subscribers
    @Published var users: String = ""
    
    // could declare init as async, may be difficult to follow sync initialization, more appropriate to use task
    init() {
        
        Task {
            
            await loadUsers()
            
        }
        
    }
    
    // When you create an instance of UserData, it will load ten generated users into the users property
    func loadUsers() async {
        
        do {
            
            let users = try await UserFetchingClient.getUsers()
            self.users = users
            
        } catch {
            
            print(error)
            
        }
        
    }
    
}
