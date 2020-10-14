//
//  UsersTableViewController.swift
//  Demo Clean Swift
//
//  Created by Vladislav Lazarev on 08.10.2020.
//  Copyright © 2020 Vladislav Lazarev. All rights reserved.
//

import UIKit

protocol UsersDisplayLogic: class {
    func displayFetchedUsers(viewModel: Users.FetchUsers.ViewModel)
}

class UsersTableViewController: UITableViewController, UsersDisplayLogic {
    
    var interactor: UsersInteractor?
    var router: UsersRouter?
    
    var displayedUsers: [Users.FetchUsers.ViewModel.DisplayedUsers] = []
    
    // MARK: Setup
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        let viewController = self
        let interactor = UsersInteractor()
        let presenter = UsersPresenter()
        let router = UsersRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchOrders()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    func fetchOrders() {
        let request = Users.FetchUsers.Request()
        interactor?.fetchUsers(request: request)
    }
    
    func displayFetchedUsers(viewModel: Users.FetchUsers.ViewModel) {
        displayedUsers = viewModel.displayedUsers
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayedUsers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        
        let displayedUser = displayedUsers[indexPath.row]
        cell.textLabel?.text = displayedUser.fullName
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowUserDetail", sender: self)
    }
}
