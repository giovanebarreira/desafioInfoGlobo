//
//  HomeModel.swift
//  DesafioInfoGlobo
//
//  Created by Giovane Barreira on 12/12/20.
//

import Foundation

struct HomeSceneModel: Decodable {
    var content: [Content]?
    var product: String?
    
    enum CodingKeys: String, CodingKey {
        case content = "conteudos"
        case product = "produto"
    }
}

struct Content: Decodable {
    var authors: [String]?
    var advertisement: Bool?
    var subtitle: String?
    var text: String?
    var videos: [Data]?
    var updatedIn: String?
    var id: Int?
    var publishedIn: String?
    var section: Section?
    var kind: String?
    var title: String?
    var url: String?
    var originalUrl: String?
    var images: [Image]?
    
    enum CodingKeys: String, CodingKey {
        case authors = "autores"
        case advertisement = "informePublicitario"
        case subtitle = "subTitulo"
        case text = "texto"
        case videos = "videos"
        case updatedIn = "atualizadoEm"
        case id = "id"
        case publishedIn = "publicadoEm"
        case section = "secao"
        case kind = "tipo"
        case title = "titulo"
        case url = "url"
        case originalUrl = "urlOriginal"
        case images = "imagens"
        
    }
}

struct Section: Decodable {
    var name: String?
    var url: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "nome"
        case url = "url"
    }
}

struct Image: Decodable {
    var author: String?
    var source: String?
    var subtitle: String?
    var imageUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case author = "autor"
        case source = "fonte"
        case subtitle = "legenda"
        case imageUrl = "url"
    }
}
