//
//  DetailPresenter.swift
//  Demo Clean Swift
//
//  Created by Vladislav Lazarev on 09.10.2020.
//  Copyright © 2020 Vladislav Lazarev. All rights reserved.
//

import Foundation

protocol DetailPresentationLogic {
    func presentUser(response: Detail.getDetail.Response)
}

class DetailPresenter: DetailPresentationLogic {
    weak var viewController: DetailDisplayLogic?
    
    func presentUser(response: Detail.getDetail.Response) {
        
        let user = Detail.getDetail.ViewModel.DisplayedUser(name: response.user.name, lastName: response.user.lastName)
        
        let viewModel = Detail.getDetail.ViewModel(displayedUser: user)
        viewController?.displayDetail(viewModel: viewModel)
    }
}

