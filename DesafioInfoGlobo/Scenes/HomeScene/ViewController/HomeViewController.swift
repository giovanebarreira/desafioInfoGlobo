//
//  HomeViewController.swift
//  DesafioInfoGlobo
//
//  Created by Giovane Barreira on 12/12/20.
//

import UIKit


class HomeSceneViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var homeTableView: UITableView!
    
    //MARK: - Properties
    private let viewModel: HomeSceneViewModelInputProtocol
    private var newsViewData: HomeSceneViewDataType? {
        didSet{
            DispatchQueue.main.async {
                self.homeTableView.reloadData()
            }
        }
    }
    //MARK: - Constants
    private let cellIdentifier = "cell"
    
    //MARK: - Constructors
    init(viewModel: HomeSceneViewModelInputProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.title = "O Globo"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getContent()
        setupTableView()
    }
    
    func setupTableView() {
        let nibName = String(describing: HomeTableViewCell.self)
        self.homeTableView.register(UINib(nibName: nibName, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        homeTableView.dataSource = self
        homeTableView.delegate = self
    }
}

extension HomeSceneViewController: HomeSceneViewModelOutputProtocol {
    func displayAllNews(newsList: HomeSceneViewDataType) {
        newsViewData = newsList
    }
    
    func displayWarning() {
        WarningView.showWarning(viewController: self)
    }
}

extension HomeSceneViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsViewData?.contentList.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = homeTableView.dequeueReusableCell(withIdentifier: cellIdentifier,
                                                     for: indexPath) as? HomeTableViewCell
        let viewData = newsViewData?.contentList[indexPath.row]
        cell?.setup(viewData: viewData)
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let selectedNews = newsViewData?.contentList[indexPath.row] {
            viewModel.didSelectNews(newsSelected: selectedNews)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
