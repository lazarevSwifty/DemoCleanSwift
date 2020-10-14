//
//  UsersRouter.swift
//  Demo Clean Swift
//
//  Created by Vladislav Lazarev on 08.10.2020.
//  Copyright © 2020 Vladislav Lazarev. All rights reserved.
//

import UIKit

@objc protocol UsersRoutingLogic {
    func routeToShowUserDetail(segue: UIStoryboardSegue)
}

protocol UsersDataPassing {
    var dataStore: UsersDataStore? { get }
}

class UsersRouter: NSObject, UsersRoutingLogic, UsersDataPassing {
    weak var viewController: UsersTableViewController?
    var dataStore: UsersDataStore?
    
    // MARK: Routing
    
    func routeToShowUserDetail(segue: UIStoryboardSegue) {
        
        let destinationVC = segue.destination as? DetailViewController
        var destinationDS = destinationVC?.interactor
        
        passDataToShowUserDetail(source: dataStore!, destination: &destinationDS!)
    }
    
    // MARK: Passing data
    
    func passDataToShowUserDetail(source: UsersDataStore, destination: inout DetailInteractor) {
        let selectedRow = viewController?.tableView.indexPathForSelectedRow?.row
        destination.user = source.users?[selectedRow!]
    }
}
