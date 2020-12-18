//
//  NewsDetailedSceneViewController.swift
//  DesafioInfoGlobo
//
//  Created by Giovane Barreira on 12/16/20.
//

import UIKit

class NewsDetailedSceneViewController: UIViewController {

    //MARK: - Outlets
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var subtitleLbl: UILabel!
    @IBOutlet weak var authorLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var imageNews: UIImageView!
    @IBOutlet weak var textTxt: UITextView!
    
    //MARK: - Properties
    private var viewModel: NewsDetailedSceneViewModelInput
    private(set) var detailedNewsViewData: NewsDetailedSceneItemType?
    
    //MARK: Constructors
    init(viewModel: NewsDetailedSceneViewModelInput) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getSelectedNews()
        setupView()
    }
    
    func setupView() {
        self.title = detailedNewsViewData?.editorialName
        titleLbl.text = detailedNewsViewData?.title
        subtitleLbl.text = detailedNewsViewData?.subtitle
        authorLbl.text = detailedNewsViewData?.authors
        dateLbl.text = detailedNewsViewData?.publishedIn
        imageNews.image = detailedNewsViewData?.image
        textTxt.text = detailedNewsViewData?.newsText
    }
}

extension NewsDetailedSceneViewController: NewsDetailedSceneViewModelOutput {
    func showSelectedNews(viewData: NewsDetailedSceneItemType) {
        detailedNewsViewData = viewData
    }
}
