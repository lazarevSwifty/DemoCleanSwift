//
//  UsersPresenter.swift
//  Demo Clean Swift
//
//  Created by Vladislav Lazarev on 08.10.2020.
//  Copyright © 2020 Vladislav Lazarev. All rights reserved.
//

import Foundation

protocol UsersPresentationLogic {
    func presentFetchedUsers(response: Users.FetchUsers.Response)
}

class UsersPresenter: UsersPresentationLogic {
    var viewController: UsersDisplayLogic?
    
    func presentFetchedUsers(response: Users.FetchUsers.Response) {
        var displayedUsers: [Users.FetchUsers.ViewModel.DisplayedUsers] = []
        
        for user in response.users {
            let fullName = user.lastName + " " + user.name
            let displayedUser = Users.FetchUsers.ViewModel.DisplayedUsers(fullName: fullName)
            displayedUsers.append(displayedUser)
        }
        
        let viewModel = Users.FetchUsers.ViewModel(displayedUsers: displayedUsers)
        viewController?.displayFetchedUsers(viewModel: viewModel)
    }
}
