//
//  UserFetchingClient.swift
//  RandomUsers
//
//  Created by Kris Wittwer on 05/10/2022.
//

import Foundation

struct UserFetchingClient {
    
    // static url property to retrieve ten users from the random user generator api in prettyjson format
    static private let url = URL(string: "https://randomuser.me/api/?results=100&format=pretty")!
    
    // function to retrieve the random user data
    // to call an async function the calling function needs to be async
    //    makes most sense to declare getUsers async to access the url request json data directly when it becomes available
    static func getUsers() async throws -> String {
        
        // url request that retrieves the randomly generated users from the url
        // since it returns two values a tuple (data, _) was defined as we dont need the URLResponse
        // async so it begins to execute the url req immediately and doesnt block main thread
        async let (data, _) = URLSession.shared.data(from: url)
        // for usabiity and readability purposes, transform json data to json string
        // data property is async so must await as it retrieves value
        return try await String(data: data, encoding: .utf8)!
        /* The getUsers() function is declared as a throwing, asynchronous function because it executes asynchronous operations and may have errors in those operations. The call to get random user data is made asynchronously using the async keyword, then accessed using the await keyword to ensure that data is present before continuing.*/
    }
    
}
