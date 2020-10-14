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
        
        struct ViewModel {

            struct DisplayedUsers {
                let fullName: String
            }
            
            var displayedUsers: [DisplayedUsers]
        }
    }
}
