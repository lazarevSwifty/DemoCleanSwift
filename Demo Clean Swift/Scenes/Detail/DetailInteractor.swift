//
//  DetailInteractor.swift
//  Demo Clean Swift
//
//  Created by Vladislav Lazarev on 09.10.2020.
//  Copyright © 2020 Vladislav Lazarev. All rights reserved.
//

import Foundation

protocol DetailBusinessLogic {
    func getUser(request: Detail.getDetail.Request)
}

protocol DetailDataStore {
    var user: User! { get set}
}

class DetailInteractor: DetailBusinessLogic, DetailDataStore {
    
    var user: User!
    var presenter: DetailPresentationLogic?
    
    func getUser(request: Detail.getDetail.Request) {
        let response = Detail.getDetail.Response(user: user)
        presenter?.presentUser(response: response)
    }
}
