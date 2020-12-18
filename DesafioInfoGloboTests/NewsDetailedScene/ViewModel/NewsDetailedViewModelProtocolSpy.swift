//
//  NewsDetailedViewModelProtocolSpy.swift
//  DesafioInfoGloboTests
//
//  Created by Giovane Barreira on 12/18/20.
//

import Foundation
@testable import DesafioInfoGlobo

class NewsDetailedViewModelProtocolSpy: NewsDetailedSceneViewModelInput, NewsDetailedSceneViewModelOutput {
    
    var getSelectedNewsCalled = false
    var showSelectedNewsCalled = false
    var viewData: NewsDetailedSceneItemType?
    
    func getSelectedNews() {
        getSelectedNewsCalled = true
    }
    
    func showSelectedNews(viewData: NewsDetailedSceneItemType) {
        self.viewData = viewData
    }
}
