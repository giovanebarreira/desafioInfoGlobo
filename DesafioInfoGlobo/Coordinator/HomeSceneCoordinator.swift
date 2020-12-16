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
        navigationControllerLayout()
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
    
    func navigationControllerLayout() {
        self.navigationController.navigationBar.prefersLargeTitles = true
        self.navigationController.navigationBar.backgroundColor = #colorLiteral(red: 0.3032085299, green: 0.5215442777, blue: 0.6859303713, alpha: 1)
        self.navigationController.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
}
