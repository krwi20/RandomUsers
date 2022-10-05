//
//  UserData.swift
//  RandomUsers
//
//  Created by Kris Wittwer on 05/10/2022.
//

/* With the UserFetchingClient retrieving random users from the Random User Generator API, you will need a location to store the users. The UserData structure will do just that! */

import Foundation

class UserData {
    
    // since the randomly generated users is a string
    var users: String = ""
    
    // will generate random users by calling the UserFetchingClient.getUsers() once an instance of User Data is created. Set users equal to the getUsers() function call
    // could declare init as async, may be difficult to follow sync initialization, more appropriate to use task
    init() {
        
        Task {
            
            do {
                let users = try await UserFetchingClient.getUsers()
                self.users = users
            }
            
            catch {
                print(error)
            }
            
        }
        
    }
    
}
