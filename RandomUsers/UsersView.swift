//
//  UsersView.swift
//  RandomUsers
//
//  Created by Kris Wittwer on 05/10/2022.
//

import SwiftUI

struct UsersView: View {
    
    // This will generate a userdata instance ith 10 users into the userData.users
    // stateobject since it should update the ui if the users change
    @StateObject var userData = UserData()
    
    var body: some View {
        
        NavigationView {
            
            List(userData.users) { user in
                Text(user.fullName)
            }
            .navigationTitle("Random Users")
            
        }
        
    }
}

struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView()
    }
}
