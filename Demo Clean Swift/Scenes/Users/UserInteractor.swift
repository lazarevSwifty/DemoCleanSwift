//
//  UserInteractor.swift
//  Demo Clean Swift
//
//  Created by Vladislav Lazarev on 08.10.2020.
//  Copyright © 2020 Vladislav Lazarev. All rights reserved.
//

import Foundation

protocol UsersBusinessLogic {
    func fetchUsers(request: Users.FetchUsers.Request)
}

protocol UsersDataStore {
    var users: [User]? { get }
}


class UsersInteractor: UsersBusinessLogic, UsersDataStore {
    var users: [User]?
    
    var presenter: UsersPresentationLogic?
    var worker = UsersWorker()
    
    func fetchUsers(request: Users.FetchUsers.Request) {
        worker.fetchUsers(completionHandler: { users in
            self.users = users
            let response = Users.FetchUsers.Response(users: users)
            self.presenter?.presentFetchedUsers(response: response)
        })
    }
}
