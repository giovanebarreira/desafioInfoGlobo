//
//  AppCoordinator.swift
//  DesafioInfoGlobo
//
//  Created by Giovane Barreira on 12/12/20.
//

import UIKit

final class AppCoordinator {
    
    //MARK: - Properties
    private let window: UIWindow
    var navigationController: UINavigationController
    private var homeSceneModel: HomeSceneModel?
    private var newsDetailedModel: NewsDetailedModel?
    
    //MARK: - Scenes Properties
    private var homeSceneViewController: HomeSceneViewController?
    private var homeSceneViewModel: HomeSceneViewModelInputProtocol?
    private var newsDetailedViewModel: NewsDetailedSceneViewModel?
    
    //MARK: - Constructor
    init(window: UIWindow, navigationController: UINavigationController? = nil) {
        self.window = window
        self.navigationController = navigationController ?? UINavigationController()
    }
}

extension AppCoordinator: Coordinator {
    func start() {
        let view = initialScene()
        navigationController.pushViewController(view, animated: true)
                
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        navigationControllerLayout()
    }
    
    public func initialScene() -> UIViewController {
        let scene = homeViewControllerScene()
        homeSceneViewController = scene.view
        homeSceneViewModel = scene.viewModel
        return scene.view
    }

    func navigationControllerLayout() {
        self.navigationController.navigationBar.prefersLargeTitles = false
        self.navigationController.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController.navigationBar.barTintColor = #colorLiteral(red: 0.1803921569, green: 0.368627451, blue: 0.5490196078, alpha: 1)
        self.navigationController.navigationBar.tintColor = .white
        self.navigationController.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white,
                                                                       .font : UIFont.init(name: "Helvetica-Bold", size: 22.0) ?? ""]
    }
}
