//
//  UserWorker.swift
//  Demo Clean Swift
//
//  Created by Vladislav Lazarev on 08.10.2020.
//  Copyright © 2020 Vladislav Lazarev. All rights reserved.
//

import Foundation

protocol UsersWorkerProtocol {
    func fetchUsers(completionHandler: @escaping ([User]) -> Void)
}

class UsersWorker: UsersWorkerProtocol {
    
    func fetchUsers(completionHandler: @escaping ([User]) -> Void) {
        
        /// получение данных откуда-либо
        let users: [User] = [
            User(name: "Владислав", lastName: "Лазарев"),
            User(name: "Иван", lastName: "Петров"),
            User(name: "Максим", lastName: "Михеев"),
        ]
        
        completionHandler(users)
    }
}
