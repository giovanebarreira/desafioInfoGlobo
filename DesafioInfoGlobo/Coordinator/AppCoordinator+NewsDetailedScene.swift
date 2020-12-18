//
//  AppCoordinator+NewsDetailedScene.swift
//  DesafioInfoGlobo
//
//  Created by Giovane Barreira on 12/16/20.
//

import Foundation

extension AppCoordinator {
    func newsDetailedViewControllerScene(model: NewsDetailedModel) -> (view: NewsDetailedSceneViewController, viewModel: NewsDetailedSceneViewModelInput) {
        let viewModel = NewsDetailedSceneViewModel(model: model)
        let viewController = NewsDetailedSceneViewController(viewModel: viewModel)
        viewModel.output = viewController
        return (viewController, viewModel)
    }
    
    func createAndGoToNewsDetailed(model: NewsDetailedModel) {
        let newsDetailedViewController = newsDetailedViewControllerScene(model: model)
        navigationController.pushViewController(newsDetailedViewController.view, animated: true)
    }
}
