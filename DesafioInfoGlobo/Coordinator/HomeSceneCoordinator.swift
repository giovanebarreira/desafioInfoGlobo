//
//  HomeCoordinator.swift
//  DesafioInfoGlobo
//
//  Created by Giovane Barreira on 12/12/20.
//

import UIKit

class HomeSceneCoordinator: Coordinator {
    
    //MARK: - Properties
    private let navigationController: UINavigationController
    
    //MARK: - Constructor
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    //MARK: - Starting Point
    func start() {
        let service = HomeSceneService()
        let viewModel = HomeSceneViewModel(service: service)
        let homeViewController = HomeSceneViewController(viewModel: viewModel)
        homeViewController.title = "O Globo"
        viewModel.output = homeViewController
        navigationController.pushViewController(homeViewController, animated: true)
    }
}
