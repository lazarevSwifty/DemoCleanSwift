//
//  UsersModels.swift
//  Demo Clean Swift
//
//  Created by Vladislav Lazarev on 08.10.2020.
//  Copyright © 2020 Vladislav Lazarev. All rights reserved.
//

import Foundation

enum Users {
    
    enum FetchUsers {
        
        struct Request {
            
        }
        
        struct Response {
            var users: [User]
        }
        
        struct ViewModel: Equatable {

            struct DisplayedUsers: Equatable {
                let fullName: String
            }
            
            var displayedUsers: [DisplayedUsers]
            
            static func == (lhs: Users.FetchUsers.ViewModel, rhs: Users.FetchUsers.ViewModel) -> Bool {
                lhs.displayedUsers == rhs.displayedUsers
            }
        }
    }
}
