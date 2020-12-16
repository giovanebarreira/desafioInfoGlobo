//
//  HomeSceneViewData.swift
//  DesafioInfoGlobo
//
//  Created by Giovane Barreira on 12/14/20.
//

import Foundation

protocol HomeSceneViewDataType {
    var contentList: [HomeSceneViewDataItemType] { get }
}

protocol HomeSceneViewDataItemType {
    var sectionTitle: String { get }
    var newsTitle: String { get }
    var newsImage: [String] { get }
}

struct HomeSceneViewData {
    
    //MARK: - Properties
    let model: [Content]
    
    //MARK: - Constructors
    init(model: [Content], product: String? = "O Globo") {
        self.model = model
    }
}

extension HomeSceneViewData: HomeSceneViewDataType {
    var contentList: [HomeSceneViewDataItemType] {
        return model.map{ HomeSceneViewDataItem(model: $0) }
    }
}

struct HomeSceneViewDataItem {
    
    //MARK: - Properties
    let model: Content
    
    init(model: Content) {
        self.model = model
    }
}

extension HomeSceneViewDataItem: HomeSceneViewDataItemType {
    var sectionTitle: String {
        guard let section = model.section else { return "" }
        return section.name ?? ""
    }
    
    var newsTitle: String {
        return model.title ?? ""
    }
    
    var newsImage: [String] {
        guard let image = model.images else { return [] }
        return image.map { $0.imageUrl ?? "" }
    }
}
