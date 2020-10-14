//
//  DetailViewController.swift
//  Demo Clean Swift
//
//  Created by Vladislav Lazarev on 09.10.2020.
//  Copyright © 2020 Vladislav Lazarev. All rights reserved.
//

import UIKit

protocol DetailDisplayLogic: class {
    func displayDetail(viewModel: Detail.getDetail.ViewModel)
}

class DetailViewController: UIViewController, DetailDisplayLogic {
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userLastNameLabel: UILabel!
    
    var interactor: DetailInteractor?
    
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
        let interactor = DetailInteractor()
        let presenter = DetailPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getUser()
    }
    
    func getUser() {
        let request = Detail.getDetail.Request()
        interactor?.getUser(request: request)
    }
    
    func displayDetail(viewModel: Detail.getDetail.ViewModel) {
        let displayedUser = viewModel.displayedUser
        userNameLabel.text = displayedUser.name
        userLastNameLabel.text = displayedUser.lastName
    }
}
