//
//  UsersPresenter.swift
//  Demo Clean Swift
//
//  Created by Vladislav Lazarev on 08.10.2020.
//  Copyright © 2020 Vladislav Lazarev. All rights reserved.
//

import Foundation

typealias UsersViewModel = Users.FetchUsers.ViewModel

protocol UsersPresentationLogic {
    func presentFetchedUsers(response: Users.FetchUsers.Response)
}

class UsersPresenter: UsersPresentationLogic {
    var viewController: UsersDisplayLogic?
    
    func presentFetchedUsers(response: Users.FetchUsers.Response) {
        
        let displayedUsers = formattingUsers(users: response.users)
        
        let viewModel = Users.FetchUsers.ViewModel(displayedUsers: displayedUsers)
        viewController?.displayFetchedUsers(viewModel: viewModel)
    }
    
    private func formattingUsers(users: [User]) -> [UsersViewModel.DisplayedUsers] {
        var displayedUsers: [UsersViewModel.DisplayedUsers] = []

        for user in users {
            let fullName = formattingUserFullName(name: user.name, lastName: user.lastName)
            let displayedUser = UsersViewModel.DisplayedUsers(fullName: fullName)
            displayedUsers.append(displayedUser)
        }
        
        return displayedUsers
    }
    
    private func formattingUserFullName(name: String, lastName: String) -> String {
        return lastName + " " + name
    }
}
