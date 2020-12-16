//
//  AppCoordinator.swift
//  DesafioInfoGlobo
//
//  Created by Giovane Barreira on 12/12/20.
//

import UIKit

final class AppCoordinator: Coordinator {
    
    //MARK: - Properties
    private let window: UIWindow
    
    //MARK: - Constructor
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let navigationController = UINavigationController()
        
        let homeViewController = HomeSceneCoordinator(navigationController: navigationController)
        homeViewController.start()
                
        window.rootViewController = navigationController
        window.makeKeyAndVisible() 
    }
}
