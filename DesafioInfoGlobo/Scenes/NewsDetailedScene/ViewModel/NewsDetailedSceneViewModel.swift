//
//  NewsDetailedSceneViewModel.swift
//  DesafioInfoGlobo
//
//  Created by Giovane Barreira on 12/16/20.
//

import Foundation

protocol NewsDetailedSceneViewModelInput {
    func getSelectedNews()
}

protocol NewsDetailedSceneViewModelOutput: class {
    func showSelectedNews(viewData: NewsDetailedSceneItemType)
}

class NewsDetailedSceneViewModel {
    
    //MARK: - Properties
    private var model: NewsDetailedModel?
    weak var output: NewsDetailedSceneViewModelOutput?
    
    init(model: NewsDetailedModel? = nil) {
        self.model = model
    }
}

extension NewsDetailedSceneViewModel: NewsDetailedSceneViewModelInput {
    func getSelectedNews() {
        guard let model = model else { return }
        let selectedNews = NewsDetailedSceneViewData(model: model)
        output?.showSelectedNews(viewData: selectedNews)
    }
}
