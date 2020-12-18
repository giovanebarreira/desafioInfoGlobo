//
//  HomeSceneViewModel.swift
//  DesafioInfoGlobo
//
//  Created by Giovane Barreira on 12/12/20.
//

import Foundation

protocol HomeSceneCoordinatorDelegate: class {
    func showDetailedNews(newsSelected: Content)
}

protocol HomeSceneViewModelInputProtocol: class {
    func getContent()
    func didSelectNews(newsSelected: HomeSceneViewDataItemType)
}

protocol HomeSceneViewModelOutputProtocol: class {
    func displayAllNews(newsList: HomeSceneViewDataType)
    func displayWarning()
}

class HomeSceneViewModel {
    
    //MARK: - Properties
    weak var output: HomeSceneViewModelOutputProtocol?
    private var service: HomeSceneServiceProtocol
    private weak var coordinatorDelegate: HomeSceneCoordinatorDelegate?
    
    init(service: HomeSceneServiceProtocol,
         coordinatorDelegate: HomeSceneCoordinatorDelegate? = nil) {
        self.service = service
        self.coordinatorDelegate = coordinatorDelegate
    }
}

extension HomeSceneViewModel: HomeSceneViewModelInputProtocol {
    
    func didSelectNews(newsSelected: HomeSceneViewDataItemType) {
        guard let convertToContent = (newsSelected as? HomeSceneViewDataItem)?.model else { return }
        coordinatorDelegate?.showDetailedNews(newsSelected: convertToContent)
    }
    
    func getContent() {
        service.fetchList { [weak self] newsContent in
            if let content = newsContent.first {
    
                let contentList: [Content] = content.content ?? []
                let newsList = HomeSceneViewData(model: contentList)
                self?.output?.displayAllNews(newsList: newsList)
                
            }
        } failure: { error in
            self.output?.displayWarning()
            print(error.localizedDescription)
        }
    }
}
