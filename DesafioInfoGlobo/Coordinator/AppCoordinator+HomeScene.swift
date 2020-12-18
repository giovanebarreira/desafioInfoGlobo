//
//  HomeCoordinator.swift
//  DesafioInfoGlobo
//
//  Created by Giovane Barreira on 12/12/20.
//

import UIKit

extension AppCoordinator {
    func homeViewControllerScene() -> (view: HomeSceneViewController, viewModel: HomeSceneViewModelInputProtocol) {
        let service = HomeSceneService()
        let viewModel = HomeSceneViewModel(service: service, coordinatorDelegate: self)
        let viewController = HomeSceneViewController(viewModel: viewModel)
        viewModel.output = viewController
        return (viewController, viewModel)
    }
}

//MARK: - Delegates Implementation
extension AppCoordinator: HomeSceneCoordinatorDelegate {
    func showDetailedNews(newsSelected: Content) {
        
        let convertToDetailedModel = NewsDetailedModel(editorialName: newsSelected.section?.name,
                                                       title: newsSelected.title,
                                                       subtitle: newsSelected.subtitle,
                                                       authors: newsSelected.authors ?? [],
                                                       publishedIn: newsSelected.publishedIn,
                                                       image: newsSelected.images ?? [],
                                                       newsText: newsSelected.text)
        
        createAndGoToNewsDetailed(model: convertToDetailedModel)
    }
}

                                
