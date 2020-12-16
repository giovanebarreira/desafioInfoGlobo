//
//  HomeSceneService.swift
//  DesafioInfoGlobo
//
//  Created by Giovane Barreira on 12/12/20.
//

import Foundation

protocol HomeSceneServiceProtocol {
    typealias fetchContentListSuccess = (([HomeSceneModel]) -> ())
    typealias fetchError = ((Error) -> ())
    
    func fetchList(success: @escaping fetchContentListSuccess,
                   failure: @escaping fetchError)
}

struct HomeSceneService: HomeSceneServiceProtocol {
    
    private let url = "https://raw.githubusercontent.com/Infoglobo/desafio-apps/master/capa.json"
    private var decoder = JSONDecoder()
    
    func fetchList(success: @escaping fetchContentListSuccess, failure: @escaping fetchError) {
        guard let endpoint = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: endpoint) { (data, response, error) in
            
            do {
                guard let data = data else { return }
                let json = try decoder.decode([HomeSceneModel].self, from: data)
                success(json)
            } catch {
                failure(error)
            }
        }.resume()
    }
}

