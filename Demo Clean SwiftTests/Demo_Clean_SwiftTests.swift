//
//  Demo_Clean_SwiftTests.swift
//  Demo Clean SwiftTests
//
//  Created by Vladislav Lazarev on 16.10.2020.
//  Copyright © 2020 Vladislav Lazarev. All rights reserved.
//


import XCTest
@testable import Demo_Clean_Swift

class Demo_Clean_SwiftTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}

struct WorkerStub: UsersWorkerProtocol {
    func fetchUsers(completionHandler: @escaping ([User]) -> Void) {
        
        let users: [User] = [
            User(name: "Владислав", lastName: "Лазарев"),
            User(name: "Иван", lastName: "Петров"),
            User(name: "Максим", lastName: "Михеев"),
        ]
        
        completionHandler(users)
    }
}

class WorkerTests: XCTestCase {
    func test_fetchUsers_shouldReturnUsersArrayFromWorker() {
        let worker = WorkerStub()
        let interactor = UsersInteractor()
        interactor.worker = worker
        
        let resultUser: [User] = [
            User(name: "Владислав", lastName: "Лазарев"),
            User(name: "Иван", lastName: "Петров"),
            User(name: "Максим", lastName: "Михеев"),
        ]
        
        let completionExpectation = expectation(description: "The completion function must be invoked")
        
        interactor.worker.fetchUsers(completionHandler: { fethedUsers in
            
            completionExpectation.fulfill()
            
            XCTAssertEqual(fethedUsers, resultUser)
        })
        
        waitForExpectations(timeout: 1.0)
    }
}

class UserViewControllerStub: UITableViewController, UsersDisplayLogic {
    var displayedViewModel: Users.FetchUsers.ViewModel?
    
    func displayFetchedUsers(viewModel: Users.FetchUsers.ViewModel) {
        displayedViewModel = viewModel
    }
}

class UserPresenterTest: XCTestCase {
    func test_presentFetchedUsers_shouldReturnConcatNameAndLastName() {
        let users: [User] = [
            User(name: "Владислав", lastName: "Лазарев"),
            User(name: "Иван", lastName: "Петров"),
            User(name: "Максим", lastName: "Михеев"),
        ]
        
        let resultViewModel = Users.FetchUsers.ViewModel(displayedUsers:
            [
                Users.FetchUsers.ViewModel.DisplayedUsers(fullName: "Лазарев Владислав"),
                Users.FetchUsers.ViewModel.DisplayedUsers(fullName: "Петров Иван"),
                Users.FetchUsers.ViewModel.DisplayedUsers(fullName: "Михеев Максим")
        ])
        
        let response = Users.FetchUsers.Response(users: users)

        
        let presenter = UsersPresenter()
        let viewController = UserViewControllerStub()
        presenter.viewController = viewController
        
        presenter.presentFetchedUsers(response: response)
        
        let displayedViewModel = viewController.displayedViewModel
        XCTAssertEqual(resultViewModel, displayedViewModel)
    }
}
