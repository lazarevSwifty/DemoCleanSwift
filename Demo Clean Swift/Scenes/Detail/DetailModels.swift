//
//  DetailModels.swift
//  Demo Clean Swift
//
//  Created by Vladislav Lazarev on 09.10.2020.
//  Copyright © 2020 Vladislav Lazarev. All rights reserved.
//

import Foundation

enum Detail {
    
    enum getDetail {
        
        struct Request {
            
        }
        
        struct Response {
            var user: User
        }
        
        struct ViewModel {
            
            struct DisplayedUser {
                let name: String
                let lastName: String
            }
            
            var displayedUser: DisplayedUser
        }
    }
}
