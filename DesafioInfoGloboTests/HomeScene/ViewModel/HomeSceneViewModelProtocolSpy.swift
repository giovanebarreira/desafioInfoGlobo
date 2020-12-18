//
//  HomeSceneViewModelDelegateSpy.swift
//  DesafioInfoGloboTests
//
//  Created by Giovane Barreira on 12/18/20.
//

import Foundation
@testable import DesafioInfoGlobo

class HomeSceneViewModelProtocolSpy: HomeSceneCoordinatorDelegate, HomeSceneViewModelInputProtocol, HomeSceneViewModelOutputProtocol {
    
    var showDetailedNewsCalled = false
    var newsSelected: Content?
    var getContentCalled = false
    var didSelectNewsCalled = false
    var newsSelectedViewData: HomeSceneViewDataItemType?
    var displayAllNewsCalled = false
    var newsList: HomeSceneViewDataType?
    var didDisplayWarningCalled = false
    
    func showDetailedNews(newsSelected: Content) {
        showDetailedNewsCalled = true
        self.newsSelected = newsSelected
    }
    
    func getContent() {
        getContentCalled = true
    }
    
    func didSelectNews(newsSelected: HomeSceneViewDataItemType) {
        didSelectNewsCalled = true
        newsSelectedViewData = newsSelected
    }
    
    func displayAllNews(newsList: HomeSceneViewDataType) {
        displayAllNewsCalled = true
        self.newsList = newsList
    }
    
    func displayWarning() {
        displayAllNewsCalled = true
    }
}
