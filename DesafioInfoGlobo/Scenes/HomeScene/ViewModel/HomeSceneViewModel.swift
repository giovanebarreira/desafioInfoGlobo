//
//  HomeSceneViewModel.swift
//  DesafioInfoGlobo
//
//  Created by Giovane Barreira on 12/12/20.
//

import Foundation

protocol HomeSceneViewModelInputProtocol: class {

    func getContent()
    func selectNews(viewData: HomeSceneViewDataType)
}

protocol HomeSceneViewModelOutputProtocol: class {
    func displayAllNews(newsList: HomeSceneViewDataType)
}

class HomeSceneViewModel {
    
    //MARK: - Properties
    weak var output: HomeSceneViewModelOutputProtocol?
    private var service: HomeSceneServiceProtocol
    private var contentModel: HomeSceneModel?
    
    init(service: HomeSceneServiceProtocol) {
        self.service = service
    }
}

extension HomeSceneViewModel: HomeSceneViewModelInputProtocol {
    func getContent() {
        service.fetchList { [weak self] newsContent in
            if let content = newsContent.first {
                self?.contentModel = content
            
                let contentList: [Content] = content.content ?? []
                let newsList = HomeSceneViewData(model: contentList)
    
                self?.output?.displayAllNews(newsList: newsList)
            
            }
        } failure: { error in
            print(error.localizedDescription)
        }

    }
    
    func selectNews(viewData: HomeSceneViewDataType) {
        
    }
}
