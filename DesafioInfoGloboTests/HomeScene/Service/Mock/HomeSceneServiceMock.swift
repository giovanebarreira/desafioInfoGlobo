//
//  HomeSceneServiceMock.swift
//  DesafioInfoGloboTests
//
//  Created by Giovane Barreira on 12/18/20.
//

import Foundation
@testable import DesafioInfoGlobo

protocol HomeSceneServiceMock: HomeSceneServiceProtocol {
    var fetchListCalled: Bool { get }
    var model: [HomeSceneModel] { get }
}

class HomeSceneServiceSuccessMock: HomeSceneServiceMock {

    var fetchListCalled: Bool = false
    var model: [HomeSceneModel] = []
    
    //MARK: - Implementation
    func fetchList(success: @escaping fetchContentListSuccess, failure: @escaping fetchError) {
        fetchListCalled = true
    
        let path = Bundle.main.url(forResource: "RequestMock", withExtension: "json")!
       
        let data = try! Data(contentsOf: path, options: .alwaysMapped)
        let model =  try! JSONDecoder().decode([HomeSceneModel].self, from: data)
        self.model = model
        success(model)
    }
}

class HomeSceneServiceFailureMock: HomeSceneServiceMock {
   
    enum Failure: Error {
        case requestError
    }
    
    // MARK: - Properties
    let failureError: Error
    var fetchListCalled: Bool = false
    var model: [HomeSceneModel] = []
    
    //MARK: - Constructors
    init(failureError: Error) {
        self.failureError = failureError
    }
    
    //MARK: - Implementation
    func fetchList(success: @escaping fetchContentListSuccess, failure: @escaping fetchError) {
        fetchListCalled = true
        self.model = []
        failure(failureError)
    }
}
